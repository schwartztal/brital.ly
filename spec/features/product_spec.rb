require 'rails_helper'

describe "the product views for any user", :type => :feature do
  let!(:product) {FactoryGirl.create :product}

  it "shows a product list view with all products" do
    visit products_path
    expect(page).to have_content(product.title)
    end
end
