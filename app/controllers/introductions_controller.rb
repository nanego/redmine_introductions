class IntroductionsController < ApplicationController
  unloadable

  before_filter :require_admin, except: [:do_not_show_again, :show_again, :update_last_view_date]
  layout "admin"

  def index
    @introductions = Introduction.order("id asc").all
  end

  def new
    @introduction = Introduction.new
    @introduction.introduction_steps.build
    render :layout => 'base'
  end

  def create
    @introduction = Introduction.new(params[:introduction])

    @introduction.introduction_steps.each do |s|
      s.step = 1 if s.step.blank?
    end

    respond_to do |format|
      if @introduction.save
        format.html { redirect_to introductions_url, notice: 'New introduction was successfully created.' }
        format.json { render json: @introduction, status: :created, location: @introduction }
      else
        format.html { render action: "new" }
        format.json { render json: @introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @introduction = Introduction.find(params[:id])
    @intros_users = @introduction.introductions_users.where("last_view > ? OR blocked=#{Introduction.connection.quoted_true}", Time.now-1.day).order("last_view desc").all
    render :layout => 'base'
  end

  def update
    @introduction = Introduction.find(params[:id])

    respond_to do |format|
      if @introduction.update_attributes(params[:introduction])
        format.html { redirect_to introductions_url, notice: 'Introduction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy

    respond_to do |format|
      format.html { redirect_to introductions_url }
      format.json { head :no_content }
    end
  end

  def do_not_show_again
    @intro_user = IntroductionsUser.find_or_create_by_introduction_id_and_user_id(params[:introduction_id].to_i, User.current.id)
    @intro_user.blocked = true
    @intro_user.last_view = Time.now
    @intro_user.save!
  end

  def show_again
    @intro_user = IntroductionsUser.find_by_introduction_id_and_user_id(params[:introduction_id], params[:user_id])
    @intro_user.destroy if @intro_user

    @introduction = Introduction.find(params[:introduction_id])
    @intros_users = @introduction.introductions_users.where("last_view > ? OR blocked=#{Introduction.connection.quoted_true}", Time.now-1.day).order("last_view desc").all
  end

  def update_last_view_date
    @intro_user = IntroductionsUser.find_or_create_by_introduction_id_and_user_id(params[:introduction_id].to_i, User.current.id)
    @intro_user.blocked = false
    @intro_user.last_view = Time.now
    @intro_user.save!
    render action: "do_not_show_again"
  end

end
