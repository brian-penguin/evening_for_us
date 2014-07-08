class NumbersController <ApplicationController

  before_action :authenticate_user!

  def index
    @numbers = Number.where(params[:user_id])
  end

  def new
    @number = Number.new
  end

  def create
    @number = current_user.numbers.create(number_params)

    if @number.save
      flash[:notice] = 'Number added!'
      redirect_to root_path
    else
      flash.now[:alert] = @number.errors.full_messages.join(', ')
      render :new
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def number_params
    params.require(:number).permit(:number, :name, :user_id)
  end
end
