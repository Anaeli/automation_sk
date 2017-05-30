# Singleton for Transporter class
def transporter
  @transporter ||= Transporter.new
end

# This class is to navigate across application using URLs
class Transporter
  include Capybara::DSL

  # Method that goes to specified URL
  # @param url that represent the page URL
  def go_to_url(url)
    visit("https://#{url}")
  end
end
