FactoryGirl.define do
  factory :product do
    title {Faker::App.name}
    description {Faker::Commerce.product_name}
    image_url {Faker::Internet.domain_name}
    price {rand(100)}
    inventory_quantity {rand(20)}
    brand_id {rand(10)}
    category_id {rand(10)}
    supplier_id {rand(10)}
  end

  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password(5,8)}
    factory :admin do
      admin {true}
    end
  end

end
