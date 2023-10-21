class TemptationsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]
  before_action :set_temptation, only: [:show, :edit, :update]

  def new
    @temptation_form = TemptationForm.new
  end

  def create
    @temptation_form = TemptationForm.new(temptation_form_params)
    if @temptation_form.valid?
      @temptation_form.save
      redirect_to lists_temptations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    temptation_attributes = @temptation.attributes
    @temptation_form = TemptationForm.new(temptation_attributes)
    if @temptation.tags.present?
      tags = []
      @temptation.tags.each do |tag|
        tags << tag.tag_name
      end
      @temptation_form.tag_name = tags.join(' ')
    end
  end

  def update
    @temptation_form = TemptationForm.new(temptation_form_params)
    if @temptation_form.valid?
      @temptation_form.update(temptation_form_params, @temptation)
      redirect_to lists_temptations_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    temptation = Temptation.find(params[:id])
    temptation.destroy
    redirect_to lists_temptations_path
  end

  def lists
    @temptations = current_user.temptations.order("created_at DESC")
  end

  private

  def temptation_form_params
    params.require(:temptation_form).permit(:event, :talk, :cost, :get_out, :tag_name).merge(user_id: current_user.id)
  end

  def move_to_index
    temptation = Temptation.find(params[:id])
    if current_user.id != temptation.user.id
      redirect_to root_path
    end
  end

  def set_temptation
    @temptation = Temptation.find(params[:id])
  end
end
