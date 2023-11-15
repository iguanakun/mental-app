class MemosController < ApplicationController
  before_action :authenticate_user!

  def index
    @cbt_basics = current_user.cbt_basics
    @monitorings = current_user.monitorings
    @lists = (@cbt_basics + @monitorings).order("created_at DESC")
  end
end
