class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :topic
      t.string :description

      t.timestamps
    end
  end
end
