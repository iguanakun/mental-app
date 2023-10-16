class MonitoringsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]
  before_action :set_monitoring, only: [:show, :edit]

  def index
  end

  def new
    @monitoring = Monitoring.new
  end

  def create
    @monitoring = Monitoring.new(monitoring_params)
    if @monitoring.save
      redirect_to lists_monitorings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @monitoring = Monitoring.find(params[:id])
    if @monitoring.update(monitoring_params)
      redirect_to lists_monitorings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    monitoring = Monitoring.find(params[:id])
    monitoring.destroy
    redirect_to lists_monitorings_path
  end

  def lists
    @monitorings = current_user.monitorings.order("created_at DESC")
  end

  private

  def monitoring_params
    params.require(:monitoring).permit(:fact, :mind, :feel, :body, :behavior).merge(user_id: current_user.id)
  end

  def move_to_index
    monitoring = Monitoring.find(params[:id])
    if current_user.id != monitoring.user.id
      redirect_to root_path
    end
  end

  def set_monitoring
    @monitoring = Monitoring.find(params[:id])
  end

end
