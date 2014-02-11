require File.expand_path('../../test_helper', __FILE__)

class IntroductionsTest < ActiveSupport::TestCase

  self.fixture_path = File.dirname(__FILE__) + "/../fixtures/"
  fixtures :introductions, :introduction_steps

  test "IntroductionStep#destroy" do
    step = IntroductionStep.find(2)
    assert_difference 'Introduction.find(1).introduction_steps.count', -1 do
      step.destroy
    end
  end

end
