require 'rails_helper'

describe "User and Admin account functionality" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
    @admin2 = FactoryGirl.create(:admin)
    # login_as (admin :scope => :user)
  end

    context "admin login works"
      it "admin can sign in" do
        visit new_user_session_path
        fill_in 'Email', :with => @admin.email
        fill_in 'Password', :with => @admin.password
        click_button 'Log in'
        expect(page).to have_content 'successfully'
      end

      it "admin sign in fails with wrong credentials" do
        visit new_user_session_path
        fill_in 'Email', :with => @admin.email
        fill_in 'Password', :with => '12345678'
        click_button 'Log in'
        expect(page).to have_content 'Invalid'
      end

    context "user login works"
      it "user can sign in" do
        visit new_user_session_path
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => @user.password
        click_button 'Log in'
        expect(page).to have_content 'successfully'
      end

      it "admin sign in fails with wrong credentials" do
        visit new_user_session_path
        fill_in 'Email', :with => 'admin@tal.com'
        fill_in 'Password', :with => '12345678'
        click_button 'Log in'
        expect(page).to have_content 'Invalid'
      end

    context "admins can give other users admin access"
      it "admins can grant other users admin privileges" do
        visit new_user_session_path
        fill_in 'Email', :with => @admin.email
        fill_in 'Password', :with => @admin.password
        click_button 'Log in'
        visit edit_user_path(@user)
        check 'user_admin'
        click_button 'Update User'
        expect(page).to have_content "Admin? true"
      end

      it "admins can remove other user's admin privileges" do
        visit new_user_session_path
        fill_in 'Email', :with => @admin.email
        fill_in 'Password', :with => @admin.password
        click_button 'Log in'
        visit edit_user_path(@admin2)
        uncheck 'user_admin'
        click_button 'Update User'
        expect(page).to have_content "Admin? false"
      end

end
