class CartsController < ApplicationController

  def show
    @products = current_user.products
  end

  def add_item
  end

  def remove_item
  end

  def update_item
  end

  helper_method :item_quantity, :item_total,  :sub_total, :tax, :total

  private

  def item_quantity(item_id)
    current_user.carts.where(product_id: item_id).first.quantity
  end

  def item_total(item_id)
    item_quantity(item_id) * Item.find(item_id).price
  end

  def sub_total

  end

end
