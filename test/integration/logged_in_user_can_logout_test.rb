require 'test_helper'

class LoggedInUserCanLogoutTest < ActionDispatch::IntegrationTest

  test "user can logout" do
    # user = User.create(username: "Colin", password: "password")

    # ApplicationController.stubs(:current_user).returns(user)
    user = User.create(username: "Colin", password: "password")
    visit login_path
    fill_in "session[username]" , with: "Colin"
    fill_in "session[password]" , with: "password"

    click_button "Login"

    visit user_path(user)

    within("#greeting") do
      assert page.has_content? ("Welcome, Colin!")
    end

    click_link "Logout"

    assert page.has_content?("Login")
    refute page.has_content?("Logout")

    # if we were to just stub this out, we're not really testing the piece that we care about
    
  end
end
