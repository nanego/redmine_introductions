class IntroductionStep < ActiveRecord::Base
  unloadable

  attr_accessible :step, :text, :position, :selector, :url

  belongs_to :introduction

  default_scope order('step ASC')

end
