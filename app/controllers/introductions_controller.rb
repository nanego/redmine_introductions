class IntroductionsController < ApplicationController
  unloadable

  def index
    @introductions = Introduction.order("id asc").all
    render :layout => 'admin'
  end

  def new
    @introduction = Introduction.new
    @introduction.introduction_steps.build
  end

  def create
    @introduction = Introduction.new(params[:introduction])

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
    @introduction = Introduction.find(params[:id])
    unless @introduction.users.include?(User.current)
      @introduction.users << User.current
      @introduction.save!
    end
  end

end
