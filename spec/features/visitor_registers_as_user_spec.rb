require 'rails_helper'

describe 'Visitor Registers by clicking on register link' do

  before(:each) do
    visit '/'
    click_link("Register")
  end

  it "they should be on the register page" do
    expect(current_path).to eq(register_path)
  end

  it "they should see a form to enter their email and password" do
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
  end

  describe "When they enter their information and hit submit" do

    before(:each) do
      fill_in "Name", with: "Anne"
      fill_in "Email", with: "anemail@gamil.com"
      fill_in "Password", with: "12345"
      fill_in "Password confirmation", with: "12345"
      click_button("Create User")
    end

    it "they should redirected to the hompage" do
      expect(current_path).to eq(root_path)
    end

    it "they should see a link to My Favorites and logout instead of login and register" do
      expect(page).to have_link("My Favorites")
      expect(page).to have_link("Logout")
      expect(page).to_not have_link("Login")
      expect(page).to_not have_link("Register")
    end

  end

end
