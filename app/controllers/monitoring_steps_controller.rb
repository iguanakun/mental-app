class MonitoringStepsController < ApplicationController
  before_action :authenticate_user!

  def step1
    @monitoring_form = MonitoringForm.new
  end

  def step2
    session[:fact] = monitoring_form_params[:fact]
    session[:mind] = monitoring_form_params[:mind]
    session[:feel] = monitoring_form_params[:feel]
    session[:body] = monitoring_form_params[:body]
    session[:behavior] = monitoring_form_params[:behavior]
    @monitoring_form = MonitoringForm.new
  end

  def create
    @monitoring_form = MonitoringForm.new(monitoring_form_params)
    @monitoring_form.fact = session[:fact]
    @monitoring_form.mind = session[:mind]
    @monitoring_form.feel = session[:feel]
    @monitoring_form.body = session[:body]
    @monitoring_form.behavior = session[:behavior]

    if @monitoring_form.valid?
      @monitoring_form.save
      session.delete[:fact]
      session.delete[:mind]
      session.delete[:feel]
      session.delete[:body]
      session.delete[:behavior]
      redirect_to lists_monitorings_path
    else
      render :step1, status: :unprocessable_entity
    end
  end

  private

  def monitoring_form_params
    params.require(:monitoring_form).permit(:fact, :mind, :feel, :body, :behavior, :tag_name).merge(user_id: current_user.id)
  end

end
