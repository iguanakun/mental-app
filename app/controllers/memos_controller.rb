class MemosController < ApplicationController
  before_action :authenticate_user!

  def index
    @cbt_basics = current_user.cbt_basics.select('*, "cbt_basic" as data_type')
    @monitorings = current_user.monitorings.select('*, "monitoring" as data_type')
    @lists = (@cbt_basics + @monitorings).sort_by(&:created_at).reverse
  end
end
