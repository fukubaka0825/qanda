class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,null: false
      t.string :password_digest,null: false

      t.timestamps
    end
    # ユニーク制約を名前に
    add_index :users, :name, unique: true
  end
end
