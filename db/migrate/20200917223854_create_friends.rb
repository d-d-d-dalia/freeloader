class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do|t|
      t.string :name
      t.integer :user_id
      t.datetime :birthdate
    end
  end
end