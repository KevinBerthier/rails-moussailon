class CreateBoats < ActiveRecord::Migration[5.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.text :description
      t.string :model
      t.string :type
      t.integer :price
      t.string :model
      t.references :user, foreign_key: true, index: true
      t.string :city

      t.timestamps
    end
  end
end
