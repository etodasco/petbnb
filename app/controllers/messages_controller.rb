# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = @conversation.messages.order(created_at: :asc)
  end

  def new
    @message = Message.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.sender = current_user
    @message.receiver = (@conversation.user1 == current_user ? @conversation.user2 : @conversation.user1)

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render :new
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
