require 'rails_helper'

describe 'Visitor Registers by clicking on register link' do

  before(:each) do
    @user = User.create(name: "Bob", email: 'bob@bob.com', password: '0987654321', password_confirmation: '0987654321')
    visit '/'
    click_link("Login")
  end

  it "they should see a login form" do
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  describe 'when they fill in the form and click submit' do

    before(:each) do
      fill_in 'Email', with: 'bob@bob.com'
      fill_in 'Password', with: '0987654321'
      click_on('Log in')
    end

    it "they should be redirected to the homepage with a flash message" do
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are now logged in!")
    end

    it "they should see a link to My Favorites and logout instead of login and register" do
      expect(page).to have_link("My Favorites")
      expect(page).to have_link("Logout")
      expect(page).to_not have_link("Login")
      expect(page).to_not have_link("Register")
    end

  end

  describe "If they enter incorrect credentials" do

    it "email" do
      fill_in 'Email', with: 'gorb@bob.com'
      fill_in 'Password', with: '0987654321'
      click_on('Log in')

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Something went wrong!')
    end

    it "password" do
      fill_in 'Email', with: 'bob@bob.com'
      fill_in 'Password', with: '1234567890'
      click_on('Log in')

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Something went wrong!')
    end

    it "both" do
      fill_in 'Email', with: 'GWAR@bob.com'
      fill_in 'Password', with: '1234567890'
      click_on('Log in')

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Something went wrong!')
    end

  end

end
