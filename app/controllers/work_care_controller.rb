class WorkCareController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to  root_path
  end

  def content1
  end

  def page1
  end
end
