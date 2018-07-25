require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
   test "user can logout" do
     user = User.create(username: "Sam", password: "password")

     visit login_path
     fill_in "Username", with: user.username
     fill_in "Password", with: "password"
     click_button "Login"

     assert page.has_content?("Welcome, Sam")

     click_link "Logout"

     refute page.has_content?("Welcome, Sam")
   end
end
