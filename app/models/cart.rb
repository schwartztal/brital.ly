class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def sub_total
    (self.quantity * product.cost).round(2)
  end

  delegate :cost, :title, :inventory_quantity, to: :product


end
