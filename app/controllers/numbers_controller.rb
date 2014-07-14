class NumbersController <ApplicationController

  before_action :authenticate_user!

  # Basic Crud for Creating, indexing, and destroying numbers.

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
      redirect_to numbers_path
    else
      flash.now[:alert] = @number.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @number = Number.find(params[:id])
    @number.destroy

    redirect_to numbers_path, notice: "That's fine didn't like them much anyways"
  end

  private

  def number_params
    params.require(:number).permit(:number, :name, :user_id)
  end
end
