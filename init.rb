require 'redmine'

issue_query = (IssueQuery rescue Query)
issue_query.add_available_column(QueryColumn.new(:last_update, :value => "null"))

Issue.send(:include, LastUpdate::Patches::QueryPatch)

Redmine::Plugin.register :last_update do
  name 'Last update'
  author 'Almalence'
  description 'Adds to issue query a column that shows Date/Time and first 1000 characters of the last History entry in Issue'
  version '0.4'
end
