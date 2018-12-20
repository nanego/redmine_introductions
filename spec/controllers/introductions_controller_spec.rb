require "spec_helper"
require "active_support/testing/assertions"

describe IntroductionsController, type: :controller do
  let(:name) do
    put :update, params: {:id => Introduction.find(1).to_param, :introduction => {}}
  end

  include ActiveSupport::Testing::Assertions

  self.fixture_path = File.dirname(__FILE__) + "/../fixtures/"
  fixtures :introductions

  before do
    @request.session[:user_id] = 1
  end

  it "should get index" do
    get :index
    expect(response).to be_successful
    refute_nil assigns(:introductions)
  end

  it "should get new" do
    get :new
    expect(response).to be_successful
  end

  it "should create introduction" do
    assert_difference('Introduction.count') do
      post :create, params: {introduction: {name: "intro-A"}}
    end
    expect(response).to redirect_to(introductions_path)
  end

  it "should get edit" do
    get :edit, params: {:id => Introduction.find(1).to_param}
    expect(response).to be_successful
  end

  it "should update introduction" do
    put :update, params: {:id => Introduction.find(1).to_param, :introduction => {}}
    expect(response).to redirect_to(introductions_path)
  end

  it "should destroy introduction" do
    assert_difference('Introduction.count', -1) do
      delete :destroy, params: {:id => Introduction.find(3).to_param}
    end
    expect(response).to redirect_to(introductions_path)
  end

  it "should update last view date" do
    @request.session[:user_id] = 2
    post :update_last_view_date, params: {:format => 'js', :introduction_id => 1}

    expect(response).to be_successful
    assert_template 'do_not_show_again'
    refute_nil assigns(:intro_user)

    record = IntroductionsUser.find_by_introduction_id_and_user_id(1, 2)
    refute_nil record
    assert !record.blocked?
    expect(record.last_view.to_date).to eq Date.today
  end

  it "should do not show again" do
    @request.session[:user_id] = 2
    post :do_not_show_again, params: {:format => 'js', :introduction_id => 1}

    expect(response).to be_successful
    assert_template 'do_not_show_again'
    refute_nil assigns(:intro_user)

    record = IntroductionsUser.find_by_introduction_id_and_user_id(1, 2)
    refute_nil record
    assert record.blocked?
    expect(record.last_view.to_date).to eq Date.today
  end

  it "should show again" do
    # setup
    IntroductionsUser.find_or_create_by(introduction_id: 1, user_id: 2)
    refute_nil IntroductionsUser.find_by_introduction_id_and_user_id(1, 2)

    post :show_again, params: {:format => 'js', :introduction_id => 1, user_id: 2}
    expect(response).to be_successful
    assert_template 'show_again'
    expect(IntroductionsUser.find_by_introduction_id_and_user_id(1, 2)).to be_nil
    expect(assigns(:intros_users)).to_not be_nil
  end

end
