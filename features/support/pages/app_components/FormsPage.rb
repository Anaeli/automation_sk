module FormsPage
  extend Capybara::DSL

  @context = "//div[@class = 'docs-homescreen-item-section']"

  def FormsPage.select_form(form_name)
    within(:xpath, @context, match: :first) do
      find(:xpath, "//div[@class = 'docs-homescreen-list-item'][1]//div[text()='#{form_name}']", match: :first ).click
      puts
    end
  end
end