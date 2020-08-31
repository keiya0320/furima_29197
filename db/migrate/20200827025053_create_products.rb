class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category, null: false
      t.integer :condition, null:false
      t.integer :postage_type, null:false
      t.integer :prefecture, null:false
      t.integer :preparation_days, null:false
      t.integer :value, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end