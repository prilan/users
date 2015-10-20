class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    if params[:user_id]
      @user = User.find(params[:user_id])

      @service = Service.find_by(name: service_params[:name])
      @user.services << @service unless @service == nil

      #@services = Service.all
      #@services.each do |service|
      #  if params[:name] == service.name
      #    @user.services << service
      #    break
      #  end
      #end
    else
      @service = Service.new(service_params)
    end

    if params[:user_id]
      redirect_to user_path(@user)
    else
      if @service.save
        redirect_to @service
      else
        render 'new'
      end
    end
  end

  def deactivate
    @user = User.find(params[:user_id])
    @user.deactivate(@service.name)
    @user.save
  end

  def destroy
    @user = User.find(params[:user_id])
    @service = @user.services.find(params[:id])
    @service.destroy
    redirect_to user_path(@user)
  end

  private
  def service_params
    params.require(:service).permit(:index, :name)
  end
end
