class NumbersController <ApplicationController

  before_action :authenticate_user!

  def index
    @numbers = Number.where(params[:user_id])
  end

  def new
    @number = Number.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
