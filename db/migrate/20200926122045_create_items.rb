class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      # 新規作成
      t.integer :shipping_charge_id, null: false
      t.string  :name, null: false
      t.integer :origin_id, null:false
      t.integer :category_id, null:false
      t.integer :condition_id, null:false
      t.integer :estimate_of_deliver_id, null:false
      t.text :description, null:false
      t.integer :price, null:false
      t.references :user, null: false,foreign_key: true

      
    end
  end
end
