


def fill_in_email_password_click(email, password, password2, button_text)
  fill_in('Email',    with: email)
  fill_in('Password', with: password) if password
  fill_in('Password confirmation', with: password2) if password2
  click_button button_text
end


def sign_in(email, password)
  User.create! email: email, password: password
  
  visit new_user_session_path
  fill_in_email_password_click(email, password, nil, 'Sign in')

  assert page.has_content?('Signed in successfully.'), page.body
end

