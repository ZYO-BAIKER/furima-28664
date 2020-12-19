class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :items
  has_many :purchases
  has_many :orders
  has_many :comments, dependent: :destroy # ↑この記載により、userが削除された場合、紐づくコメントも連動して削除される
  has_many :sns_credentials
  
  validates :nickname, presence: true, length: { maximum: 40 }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合で入力して下さい'

  with_options presence: true do
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい' }
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' }
    validates :birth_date
  end

  def self.form_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
   # sns認証したことがあればアソシエーションで取得
   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
