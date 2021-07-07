class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.integer :area_id,      null: false   
      t.string  :phone_number, null: false 
      t.string :ship_city,     null: false 
      t.string :ship_address,  null: false 
      t.string :postal_code,   null: false 
      t.string :ship_to_address
      t.references :buyer, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
