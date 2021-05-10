class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.text :bio
      t.text :avatar
      t.timestamps
    end
  end
end
