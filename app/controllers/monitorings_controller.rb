class MonitoringsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]
  before_action :set_monitoring, only: [:show, :edit, :update]

  def index
  end

  def new
    @monitoring_form = MonitoringForm.new
  end

  def create
    @monitoring_form = MonitoringForm.new(monitoring_form_params)
    if @monitoring_form.valid?
      @monitoring_form.save
      redirect_to lists_monitorings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    # @monitoringから情報をハッシュとして取り出し、@monitoring_formとしてインスタンス生成する
    monitoring_attributes = @monitoring.attributes
    @monitoring_form = MonitoringForm.new(monitoring_attributes)
    @monitoring_form.tag_name = @monitoring.tags.first&.tag_name
  end

  def update
    @monitoring_form = MonitoringForm.new(monitoring_form_params)
    if @monitoring_form.valid?
      @monitoring_form.update(monitoring_form_params, @monitoring)
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

  def search
    @monitorings = Monitoring.search(params[:keyword])
  end
  
  private

  def monitoring_form_params
    params.require(:monitoring_form).permit(:fact, :mind, :feel, :body, :behavior, :tag_name).merge(user_id: current_user.id)
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
