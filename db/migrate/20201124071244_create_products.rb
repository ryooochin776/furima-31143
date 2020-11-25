class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,  foreign_key: true
      t.string :name,      null: false
      t.text :explanation, null: false
      t.integer :category_id, null:false
      t.integer :status_id, null:false
      t.integer :fee_id, null:false
      t.integer :place_id, null:false
      t.integer :days_id, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end
