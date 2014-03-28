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

  def test_update_last_view_date
    @request.session[:user_id] = 2
    post :update_last_view_date, :format => 'js', :introduction_id => 1

    assert_response :success
    assert_template 'do_not_show_again'
    assert_not_nil assigns(:intro_user)

    record = IntroductionsUser.find_by_introduction_id_and_user_id(1,2)
    assert_not_nil record
    assert !record.blocked?
    assert_equal Date.today, record.last_view.to_date
  end

  def test_do_not_show_again
    @request.session[:user_id] = 2
    post :do_not_show_again, :format => 'js', :introduction_id => 1

    assert_response :success
    assert_template 'do_not_show_again'
    assert_not_nil assigns(:intro_user)

    record = IntroductionsUser.find_by_introduction_id_and_user_id(1,2)
    assert_not_nil record
    assert record.blocked?
    assert_equal Date.today, record.last_view.to_date
  end

  def test_show_again
    # setup
    IntroductionsUser.find_or_create_by_introduction_id_and_user_id(1, 2)
    assert_not_nil IntroductionsUser.find_by_introduction_id_and_user_id(1,2)

    post :show_again, :format => 'js', :introduction_id => 1, user_id: 2
    assert_response :success
    assert_template 'show_again'
    assert_nil IntroductionsUser.find_by_introduction_id_and_user_id(1,2)
    assert_not_nil assigns(:intros_users)
  end

end
