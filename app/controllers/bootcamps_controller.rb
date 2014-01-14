class BootcampsController < ApplicationController

before_filter :authenticate_user!, only: [:edit, :destroy]

  def index
    @bootcamps = Bootcamp.published
    if params[:tag]
      @bootcamps = Bootcamp.published.tagged_with(params[:tag])
    else
      @bootcamps=Bootcamp.published
    end
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamps = Bootcamp.published
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def create
    @bootcamp = Bootcamp.new(bootcamp_params)
    if @bootcamp.save
      # message=ScholarshipMessage.new(:message_body => "A new bootcamp has been created")
      # message.deliver
      redirect_to bootcamps_path, :notice => "Thanks for adding your bootcamp! We'll review the information and get it published shortly!"
    else
      render :action => 'new', :notice => "Oops! That didn't work."
    end
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def update
    @bootcamp = Bootcamp.find(params[:id])
    if @bootcamp.update_attributes(params[:bootcamp])
      flash[:notice] = "Successfully updated bootcamp."
    end
    redirect_to(@bootcamp)
  end

  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.destroy
      flash[:notice] = "Successfully destroyed bootcamp"
      redirect_to(@bootcamp)
  end

  def statistics
    @bootcamps=Bootcamp.published

    respond_to do |format|
      format.html
      format.json { render :json => @bootcamps }
    end
  end

  def world
    respond_to do |format|
      format.html
      format.json
    end
  end

  def bootcamp_params
    params.require(:bootcamp).permit(:name, :address, :weeks, :notes, :city, :st_pr, :country, :contact_email, :website_url, :lat, :lon, :twitter_handle, :description, :tag_list, :language_list, :hours, :tuition, :primary_language, :published, :hours_per_week)
  end

end
