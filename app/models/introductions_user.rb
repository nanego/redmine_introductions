class IntroductionsUser < ActiveRecord::Base
  include Redmine::SafeAttributes

  unloadable

  safe_attributes :last_view, :blocked, :introduction_id, :user_id

  belongs_to :introduction
  belongs_to :user

end
