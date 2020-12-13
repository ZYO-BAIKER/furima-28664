crumb :root do
  link "Home", root_path
end

crumb :items do |item|
  if item == nil
    item = Item.find(params[:item_id])
  end
  link "#{item.name}", item_path(item.id)
  parent :root
end

crumb :orders do |order|
  link "購入ページ", item_orders_path(params[:item_id])
  parent :items
end

crumb :items do |item|
  link "検索結果ページ", items_search_path
  parent :root
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).