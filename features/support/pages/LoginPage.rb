# Singleton for LoginPage class
def login_page
  @login_page ||= LoginPage.new
end

# This Class contains Login Page actions
class LoginPage
  include Capybara::DSL

  # This method is to set a value in username and password field
  # @param username specifies the value to set in the username field
  # @param password specifies the value to set in the password field
  def set_credentials(username, password)
    set_field('username', username)
    set_field('password', password)
  end

  # This method is to set a value in a field
  # @param field specifies the field where a value will be set
  # @param value specifies the value to set in a field
  def set_field(field, value)
    fill_in(field, with: value)
  end

  # This method is to do click in log in button
  def click_log_in_btn
    click_button('Login')
  end
end
