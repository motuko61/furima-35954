class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name        
      t.references :user, null: false, foreign_key: true 
      t.integer :price           
      t.text :description     
      t.integer :category_id 
      t.integer :condition_id        
      t.integer :charge_id       
      t.integer :area_id         
      t.integer :days_to_ship_id        
      t.timestamps
    end
  end
end
