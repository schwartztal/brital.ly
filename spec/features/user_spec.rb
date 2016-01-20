require 'rails_helper'

describe "the admin users can log in" do
  before(:each) do
    admin = FactoryGirl.create(:user)
    # login_as (admin :scope => :user)
  end

    context "admin user exists"

    it "admin can sign in" do
      visit new_user_session_path
      fill_in 'Email', :with => 'admin@tal.com'
      fill_in 'Password', :with => '12345'
      click_button 'Log in'
      expect(page).to have_content 'successfully'
    end

    it "admin sign in fails with wrong credentials" do |variable|
      visit new_user_session_path
      fill_in 'Email', :with => 'admin@tal.com'
      fill_in 'Password', :with => '12345678'
      click_button 'Log in'
      expect(page).to have_content 'Invalid'
    end

end
