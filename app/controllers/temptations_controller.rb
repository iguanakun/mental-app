class TemptationsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]
  before_action :set_temptation, only: [:show, :edit]

  def new
    @temptation = Temptation.new
  end

  def create
    @temptation = Temptation.new(temptation_params)
    if @temptation.save
      redirect_to lists_temptations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @temptation = Temptation.find(params[:id])
    if @temptation.update(temptation_params)
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

  def temptation_params
    params.require(:temptation).permit(:event, :talk, :cost, :get_out).merge(user_id: current_user.id)
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
