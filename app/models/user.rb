class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products, through: :carts
  has_many :carts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sub_total
    self.carts.reduce(0) do |sub_amount, item|
      sub_amount += item.sub_total
    end
  end

  def tax
    (self.sub_total * tax_rate).round(2)
  end

  def tax_rate
    0.0825
  end

  def total
    self.sub_total + self.tax
  end

end
