require "spec_helper"
require "active_support/testing/assertions"

describe "Introductions" do
  include ActiveSupport::Testing::Assertions

  self.fixture_paths = File.dirname(__FILE__) + "/../fixtures/"
  fixtures :introductions, :introduction_steps

  it "should IntroductionStep#destroy" do
    step = IntroductionStep.find(2)
    assert_difference 'Introduction.find(1).introduction_steps.count', -1 do
      step.destroy
    end
  end

end
