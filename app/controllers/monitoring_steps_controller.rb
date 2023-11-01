class MonitoringStepsController < ApplicationController
  before_action :authenticate_user!

  def step1
    @monitoring_form = MonitoringForm.new
  end

  def step2
    session[:title] = monitoring_form_params[:title]
    session[:feel_id] = monitoring_form_params[:feel_id]
    session[:fact] = monitoring_form_params[:fact]
    session[:mind] = monitoring_form_params[:mind]
    @monitoring_form = MonitoringForm.new
  end

  def create
    @monitoring_form = MonitoringForm.new(monitoring_form_params)
    @monitoring_form.title = session[:title]
    @monitoring_form.feel_id = session[:feel_id]
    @monitoring_form.fact = session[:fact]
    @monitoring_form.mind = session[:mind]

    session.delete(:title)
    session.delete(:feel_id)
    session.delete(:fact)
    session.delete(:mind)

    if @monitoring_form.valid?
      @monitoring_form.save
      redirect_to lists_monitorings_path
    else
      render :step1, status: :unprocessable_entity
    end
  end

  private

  def monitoring_form_params
    params.require(:monitoring_form).permit(:title, :feel_id, :fact, :mind, :distortion_id,
                                            :why_correct, :why_doubt, :new_thought).merge(user_id: current_user.id)
  end

end
