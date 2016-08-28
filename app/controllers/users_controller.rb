class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @checklist_items = @user.checklist_items.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Weddly!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
