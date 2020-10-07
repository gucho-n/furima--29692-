class CreateDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliver_addresses do |t|
      # 作成分  
      t.string :postcode ,null: false 
      t.string :phonenumber,null: false 
      t.string :city,null: false 
      t.string :block,null: false
      t.string :building,null: true
      t.integer :address_id,null:false
      t.references :item_purchase ,null: false, foreign_key: true

      t.timestamps
    end
  end
end
