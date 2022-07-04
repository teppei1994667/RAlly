class CreateOrderStores < ActiveRecord::Migration[6.1]
  def change
    create_table :order_stores do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
