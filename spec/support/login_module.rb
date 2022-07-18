module LoginModule
  def login(user)
    visit login_path
    # fill_inの値は、ビューのフィールドのid
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
end