class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :date
      t.integer :duration 
      t.integer :repetitions
      t.timestamps
    end
  end
end
