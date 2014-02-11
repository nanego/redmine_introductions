require File.expand_path('../../test_helper', __FILE__)

class IntroductionsControllerTest < ActionController::TestCase

  self.fixture_path = File.dirname(__FILE__) + "/../fixtures/"
  fixtures :introductions

  def setup
    @request.session[:user_id] = 1
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:introductions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create introduction" do
    assert_difference('Introduction.count') do
      post :create, introduction: { name: "intro-A" }
    end

    assert_redirected_to introductions_path
  end

  test "should get edit" do
    get :edit, :id => Introduction.find(1).to_param
    assert_response :success
  end

  test "should update introduction" do
    put :update, :id => Introduction.find(1).to_param, :introduction => { }
    assert_redirected_to introductions_path
  end

  test "should destroy introduction" do
    assert_difference('Introduction.count', -1) do
      delete :destroy, :id => Introduction.find(3).to_param
    end

    assert_redirected_to introductions_path
  end

end
