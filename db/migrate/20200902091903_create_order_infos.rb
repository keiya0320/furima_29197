class CreateOrderInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :order_infos do |t|
      t.string :postal_code, default: "", null: false
      t.integer :prefecture_id, null:false
      t.string :city, default: ""
      t.string :address, default: ""
      t.string :building_name, default: ""
      t.string :phone_number, default: ""
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
