require "spec_helper"
require "active_support/testing/assertions"

describe IssuesController, type: :controller do
  include ActiveSupport::Testing::Assertions

  fixtures :projects,
           :users, :email_addresses, :user_preferences,
           :roles,
           :members,
           :member_roles,
           :issues,
           :issue_statuses,
           :issue_relations,
           :versions,
           :trackers,
           :projects_trackers,
           :issue_categories,
           :enabled_modules,
           :enumerations,
           :attachments,
           :workflows,
           :custom_fields,
           :custom_values,
           :custom_fields_projects,
           :custom_fields_trackers,
           :time_entries,
           :journals,
           :journal_details,
           :queries,
           :repositories,
           :changesets

  render_views

  before do
    User.current = User.find(1)
    @request.session[:user_id] = 1
  end

  it "should get edit and DO NOT display any warning message" do
    Setting.plugin_redmine_introductions = {"display_issue_update_warning" => "0", "issue_update_warning" => "<p id='errorExplanation'>This text will not be shown.</p>"}
    get :edit, params: {:id => Issue.find(1).to_param}
    expect(response).to be_successful
    expect(response.body).to_not match /<p id="errorExplanation">/im
  end

  it "should get edit and DISPLAY a warning message" do
    Setting.plugin_redmine_introductions = {"display_issue_update_warning" => "1", "issue_update_warning" => "Any message."}
    get :edit, params: {:id => Issue.find(1).to_param}
    expect(response).to be_successful
    expect(response.body).to match /<p id="errorExplanation">Any message.<\/p>/im
  end

end
