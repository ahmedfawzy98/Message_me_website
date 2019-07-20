class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'appearance_channel'
    user = User.find(params[:session][:user_id])
    debugger
    ActionCable.server.broadcast 'appearance_channel', user: render_online_user(user)
  end

  def unsubscribed
  end

  private

  def render_online_user(user)
    render partial: 'users/user', locals: { user: user }
  end
end
