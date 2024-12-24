class IntroductionStep < ApplicationRecord
  include Redmine::SafeAttributes

  safe_attributes :step, :text, :position, :selector, :url

  belongs_to :introduction

  default_scope { order('step ASC') }

  scope :last_introduction_step, -> { order("step desc").limit(1) }

end
