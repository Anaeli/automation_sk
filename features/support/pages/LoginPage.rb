# Singleton for LoginPage class
def login_page
  @login_page ||= LoginPage.new
end

# This Class contains Login Page actions
class LoginPage
  include Capybara::DSL

  # This method is to set a value in a field
  # @param field specifies the field where a value will be set
  # @param value specifies the value to set in a field
  def set_field(field, value)
    find(:xpath, "//input[@name='#{field}']").set(value)
  end

  # This method is to do click in a button
  # @param btn_name, button name
  def click_btn(btn_name)
    find(:xpath, "//span[text()='#{btn_name}']", match: :first).click
  end

  # Method to log in into Google forms section
  # @param user, user to log in into Google
  def log_in(user)
    email = $credentials[user]['email']
    password = $credentials[user]['password']
    case user
    when 'User A'
      transporter.go_to_url(USER_A_HOST)
      set_field('identifier', email)
      click_btn('Next')
      set_field('password', password)
      click_btn('Next')
    when 'User B'
      transporter.go_to_url(USER_B_HOST)
    end
  end
end
