class AddQuestionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :question, index: true,foreign_key: true
  end
end
