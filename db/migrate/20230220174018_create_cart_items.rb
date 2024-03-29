class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false
      # t.references :item, foreign_key: true
      t.integer :customer_id, null: false
      # t.references :customer, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
