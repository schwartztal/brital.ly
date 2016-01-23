class CartsController < ApplicationController

  def show
    @cart_items = current_user.carts
  end

  def add_item
    #check if it exists and update quantity if so
    @cart_item = Cart.where(user_id: current_user.id, product_id: params[:product_id]).first_or_create(quantity: 0)
    @cart_item.increment!(:quantity, by = 1 )
    redirect_to cart_path
    # @cart_item = Cart.create(user_id: current_user.id, product_id: params[:product_id])
  end

  def remove_item
    Cart.delete_all(product_id: params[:product_id])
    redirect_to :back
  end

  def update_item
    @cart_item = Cart.where(product_id: params[:cart][:product_id])
    @cart_item.first.update(quantity: params[:cart][:quantity])
    redirect_to :back
  end

  helper_method :item_quantity, :item_total,  :sub_total, :tax_rate, :total

  private
  def tax_rate
    0.0825
  end

  def item_quantity(item_id)
    current_user.carts.where(product_id: item_id).first.quantity
  end

  def item_total(item_id)
    item_quantity(item_id) * Item.find(item_id).price
  end

  def sub_total

  end

end
