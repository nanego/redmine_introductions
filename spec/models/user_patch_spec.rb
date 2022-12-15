require "spec_helper"
require File.dirname(__FILE__) + '/../../lib/redmine_introductions/user_patch'

describe "UserPatch" do
  fixtures :users

  it "Should update introductions_user table in case of cascade deleting" do
    user = User.last
    IntroductionsUser.create(:blocked =>  true, user_id: user.id, introduction_id: 1)
    IntroductionsUser.create(:blocked =>  true, user_id: user.id, introduction_id: 2)
    
    expect do
      user.destroy
    end.to change{ IntroductionsUser.count }.by(-2)
  end
end
