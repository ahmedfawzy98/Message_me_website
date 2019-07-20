class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new]
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      user.update(online: true)
      ActionCable.server.broadcast 'appearance_channel', { username: user.username, x: true }
      flash[:success] = 'You have successfully logged in'
      redirect_to chatroom_path
    else
      flash.now[:error] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    User.find(session[:user_id]).update(online: false)
    user = User.find(session[:user_id])
    ActionCable.server.broadcast 'appearance_channel', { username: user.username, x: false }
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = 'You are already logged in'
      redirect_to chatroom_path
    end
  end

  # def render_online_user(user)
  #   render partial: 'users/user', locals: { user: user }
  # end
end