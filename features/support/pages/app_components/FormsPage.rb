module FormsPage
  extend Capybara::DSL

  @context = "//div[@class = 'docs-homescreen-grid-item']"

  def FormsPage.select_form
    within(:xpath, @context, match: :first) do
      find(:xpath, "//div[@class = 'docs-homescreen-grid-item-title']").click
      puts
    end
  end
end