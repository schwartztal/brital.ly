class CreateJoinTableCarts < ActiveRecord::Migration
  def change
    create_join_table :users, :products, table_name: :carts do |t|
      # t.index [:user_id, :product_id]
      # t.index [:product_id, :user_id]
      t.integer :quantity
    end
  end
end
