class IntroductionsUser < ActiveRecord::Base
  unloadable

  attr_accessible :last_view, :blocked, :introduction_id, :user_id

  belongs_to :introduction
  belongs_to :user

end
