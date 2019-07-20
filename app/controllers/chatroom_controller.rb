class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all.custom_display
    @message = Message.new
    @users = User.all
  end
end