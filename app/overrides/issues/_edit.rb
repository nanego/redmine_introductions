Deface::Override.new :virtual_path  => 'issues/_edit',
                     :name          => 'add-warning-message-after-submit-button',
                     :insert_before => 'erb[loud]:contains("submit_tag l(:button_submit)")',
                     :text          => <<MESSAGE
<% if Setting.plugin_redmine_introductions["display_issue_update_warning"] == '1' %>
  <p id="errorExplanation"><%= Setting.plugin_redmine_introductions["issue_update_warning"] %></p>
<% end %>
MESSAGE
