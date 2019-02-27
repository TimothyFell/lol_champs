require 'rails_helper'

describe 'User Logs Out' do

  before(:each) do
    @user = User.create(name: "Bob", email: 'bob@bob.com', password: '0987654321', password_confirmation: '0987654321')
    visit '/login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on('Log in')
    click_on('Logout')
  end

  describe "When logged in user clicks the logout link" do

    it "they should be redirected to the homepage" do
      expect(current_path).to eq(root_path)
    end

    it "they should not see the my favorite or logout links" do
      expect(page).to_not have_content("My Favorites")
      expect(page).to_not have_content("Logout")
    end

    it "they should see the login and register links" do
      expect(page).to have_content("Login")
      expect(page).to have_content("Register")
    end

    it "if they go to /my_favorites" do
      visit '/my_favorites'

      expect(page).to have_content("You need to login or register to favorite champions")
    end

  end

end
