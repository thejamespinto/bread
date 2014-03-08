require 'test_helper'

class DeviseGuestNavigationTest < ActionDispatch::IntegrationTest
  setup do
    @email    = 'test@gmail.com'
    @password = '12345678'
    @sample_user = User.create! email: @email, password: @password
  end

  test "should sign in" do
    visit new_user_session_path
    # bread
    assert_crumb "Home"
    assert_crumb "Sign In"
    
    fill_in_email_password_click(@email, @password, nil, 'Sign in')

    assert page.has_content?('Signed in successfully.'), page.body
  end

      test "shouldnt sign in" do
        visit new_user_session_path

        click_button('Sign in')

        assert page.has_content?('Invalid email or password.'), page.body
      end

  test "should sign up" do
    visit new_user_registration_path
    # bread
    assert_crumb "Home"
    assert_crumb "Sign Up"
    fill_in_email_password_click("new@gmail.com", @password, @password, 'Sign up')

    assert page.has_content?('Welcome! You have signed up successfully.'), page.body
  end

      test "shouldnt sign up" do
        visit new_user_registration_path
        click_button('Sign up')

        assert page.has_content?('prohibited this user from being'), page.body
      end

  test "should remember" do
    visit new_user_password_path
    # bread
    assert_crumb "Home"
    assert_crumb "Sign In"
    assert_crumb "Forgot Password"
    fill_in_email_password_click(@email, nil, nil, 'Send me')

    assert page.has_content?('You will receive an email with instructions about how to reset your password in a few minutes.'), page.body
  end

      test "shouldnt remember when blank" do
        visit new_user_password_path
        click_button('Send me')

        assert page.has_content?('prohibited this user from being'), page.body
      end

      test "shouldnt remember when wrong" do
        visit new_user_password_path
        fill_in_email_password_click('wrong', nil, nil, 'Send me')

        assert page.has_content?('prohibited this user from being'), page.body  
      end

  test "should edit password" do
    raw_reset_password_token = User.last.send_reset_password_instructions

    visit edit_user_password_path(reset_password_token: raw_reset_password_token)

    # bread
    assert_crumb "Home"
    assert_crumb "Sign In"
    assert_crumb "Forgot Password"

    fill_in 'New password',         with: '12341234'
    fill_in 'Confirm new password', with: '12341234'
    click_button 'Change'

    assert page.has_content?('Your password was changed successfully. You are now signed in.'), page.body
  end

      test "shouldnt edit password when no token" do
        visit edit_user_password_path

        assert page.has_content?('please make sure you used the full URL provided.'), page.body
      end

      test "shouldnt edit password when no password" do
        raw_reset_password_token = User.last.send_reset_password_instructions

        visit edit_user_password_path(reset_password_token: raw_reset_password_token)
        click_button 'Change'

        assert page.has_content?('prohibited this user from being saved:'), page.body
      end

end

class DeviseUserNavigationTest < ActionDispatch::IntegrationTest
  setup do
    @email    = 'test@gmail.com'
    @password = '12345678'
    sign_in(@email, @password)
    @new_password = '12341234'
  end

  test "should edit profile email" do
    visit edit_user_registration_path
    # bread
    assert_crumb "Home"
    assert_crumb "Edit Profile"
    
    fill_in('Email',    with: "omg-#{@email}")
    fill_in('Current password', with: @password)
    click_button 'Update'

    assert page.has_content?('You updated your account successfully.'), page.body
  end

      test "shouldnt edit profile when no match" do
        visit edit_user_registration_path
        fill_in('Password', with: @new_password)
        click_button 'Update'

        assert page.has_content?("doesn't match"), page.body
      end

      test "shouldnt edit profile when current password is blank" do
        visit edit_user_registration_path
        fill_in('Password', with: @new_password)
        fill_in('Password confirmation', with: @new_password)
        click_button 'Update'

        assert page.has_content?("can't be blank"), page.body
      end

      test "should edit profile password" do
        visit edit_user_registration_path
        fill_in('Current password', with: @password)
        fill_in('Password', with: @new_password)
        fill_in('Password confirmation', with: @new_password)
        click_button 'Update'

        assert page.has_content?("You updated your account successfully."), page.body
      end

  test "should remove profile" do
    visit edit_user_registration_path
    click_button 'Cancel my account'

    assert page.has_content?('Bye! Your account was successfully cancelled. We hope to see you again soon.'), page.body
  end

  test "should sign out" do
    click_link 'Sign Out'

    assert page.has_content?('Signed out successfully.'), page.body
  end

end
