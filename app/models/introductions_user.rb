class IntroductionsUser < ActiveRecord::Base
  unloadable

  attr_accessible :last_view, :blocked

  belongs_to :introduction
  belongs_to :user

end
