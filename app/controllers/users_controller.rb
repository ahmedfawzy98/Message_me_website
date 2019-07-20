class UsersController < ApplicationController
  def new; end

  def create
    @user = User.create(username: params[:session][:username], password: params[:session][:password], online: true)
    session[:user_id] = @user.id
    ActionCable.server.broadcast 'appearance_channel', { username: @user.username, x: true }
    flash[:success] = 'Welcome to MessageMe App'
    redirect_to chatroom_path
  end

  private

  def user_params
    params.require(:session).permit(:username, :password)
  end
end
