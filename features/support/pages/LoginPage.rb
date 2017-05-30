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

  # This method is to do click in log in button
  def click_btn(btn_name)
    find(:xpath, "//span[text()='#{btn_name}']", match: :first).click
  end

  # Method to log in into Google forms section
  def log_in(email, password)
    transporter.go_to_url(HOST)
    set_field('identifier', email)
    click_btn('Next')
    set_field('password', password)
    click_btn('Next')
  end
end
