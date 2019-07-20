class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # @user.update(online: true)
      flash[:success] = 'Welcome to MessageMe App'
      redirect_to chatroom_path
    else
      render 'sessions/new'
    end
  end

  private

  def user_params
    params.require(:session).permit(:username, :password)
  end
end
