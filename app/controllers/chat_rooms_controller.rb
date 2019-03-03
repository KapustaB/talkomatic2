class ChatRoomsController < ApplicationController
    before_action :set_chat_room, only: :show

  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = User.first.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @messages = @chat_room.messages.order(created_at: :asc).last(20)
    @message = @chat_room.messages.new
    @message.user = current_user
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:id, :topic, :description)

  end

end
