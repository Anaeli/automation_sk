# Module to manage Work Order box information
module ContactInformation
  extend Capybara::DSL

  @context = "div[@class = 'freebirdFormviewerViewFormContent']"

  def ContactInformation.set_field(label,value)
    xpath_field ="//div[normalize-space(text())='#{label}']/ancestor::div[@class='freebirdFormviewerViewItemsItemItemHeader']/following-sibling::div"
    within(:xpath, @context) do
      find(:xpath, "#{xpath_field}//input|#{xpath_field}//textarea").set(value)
    end
  end

  def ContactInformation.click_btn(button_name)
    within(:xpath, @context) do
      find(:xpath, "//content[@class='quantumWizButtonPaperbuttonContent']//span[text()='#{button_name}']").click
    end
  end

  def ContactInformation.click_tab(tab_name)
    within(:xpath, @context) do
      find(:xpath, "//div[text()='Responses']").click
    end
  end

  def ContactInformation.get_text(label)
    find(:xpath, "//span[text()='#{label}']/ancestor::div[@class='SummaryHeaderContainer']//following-sibling::div[@class='freebirdFormeditorViewResponsesSummaryChartContainer']").text
  end
end
