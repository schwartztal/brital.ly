class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def sub_total()
    current_user.products.pluck(:cost)
  end

  def item_subtotal(product_id)
    item_quantity(product_id) * Product.find(product_id).cost
  end

  def item_quantity(product_id)
    current_user.carts.where(product_id: product_id).first.quantity
  end
end
