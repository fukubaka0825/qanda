class AddAnswerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :answer,index: true, foreign_key: true
  end
end
