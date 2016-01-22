class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products, through: :carts
  has_many :carts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
