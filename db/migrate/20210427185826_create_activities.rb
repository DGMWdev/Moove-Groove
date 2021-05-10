class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :title
      t.text :description
      t.date :date
      t.integer :distance
      t.integer :duration 
      t.integer :repetitions
      t.text :avatar
      t.timestamps
    end
  end
end
