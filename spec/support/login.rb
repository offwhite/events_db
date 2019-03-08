
def login_as_user(user, password = 'password')
  post(
    '/users/sign_in',
    params: {
      user: {
        email: user.email,
        password: password
      }
    }
  )
end
