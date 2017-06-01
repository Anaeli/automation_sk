# Module to manage the components of form page
module FormsPage
  extend Capybara::DSL

  @context = "//div[@class = 'docs-homescreen-item-section']"

  # Method to select a form
  # @param form_name, form name to select
  def FormsPage.select_form(form_name)
    within(:xpath, @context, match: :first) do
      find(:xpath, "//div[@class = 'docs-homescreen-list-item'][1]//div[text()='#{form_name}']", match: :first).click
    end
  end
end
