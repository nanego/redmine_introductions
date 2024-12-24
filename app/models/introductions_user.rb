class IntroductionsUser < ApplicationRecord
  include Redmine::SafeAttributes

  safe_attributes :last_view, :blocked, :introduction_id, :user_id

  belongs_to :introduction
  belongs_to :user

end
