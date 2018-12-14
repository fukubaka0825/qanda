class RenameContextColumnToAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :context, :content
  end
end
