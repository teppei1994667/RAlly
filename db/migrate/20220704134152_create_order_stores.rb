class CreateOrderStores < ActiveRecord::Migration[6.1]
  def change
    create_table :order_stores do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
