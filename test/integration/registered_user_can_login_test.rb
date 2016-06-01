require 'test_helper'

class RegisteredUserCanLoginTest < ActionDispatch::IntegrationTest

  test "user can login with valid credentials" do
    user = User.create(username: "Colin", password: "password")
    visit login_path
    fill_in "session[username]" , with: "Colin"
    fill_in "session[password]" , with: "password"

    click_button "Login"

    assert_equal user_path(user), current_path
    within("#greeting") do
    assert page.has_content?("Welcome, Colin!")
    end
  end

end

# think of just like minitest
