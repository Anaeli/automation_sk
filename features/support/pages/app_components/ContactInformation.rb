# Module to manage Contact Information box information
module ContactInformation
  extend Capybara::DSL

  @context = "//div[@class = 'freebirdFormviewerViewFormContent ']"

  # Method to set field on the form
  # @param label, field label name
  # @param value, value to set on the field
  def ContactInformation.set_field(label, value)
    xpath_field = "//div[normalize-space(text())='#{label}']/ancestor::"\
                  "div[@class='freebirdFormviewerViewItemsItemItemHeader']/following-sibling::div"
    within(:xpath, @context) do
      find(:xpath, "#{xpath_field}//input|#{xpath_field}//textarea").set(value)
    end
  end

  # Method to click a button on the form
  # @param btn_name, button name
  def ContactInformation.click_btn(btn_name)
    within(:xpath, @context) do
      find(:xpath, "//content[@class='quantumWizButtonPaperbuttonContent']//span[text()='#{btn_name}']").click
    end
  end

  # Method to click on a tab
  # @param tab_name, tab name
  def ContactInformation.click_tab(tab_name)
    find(:xpath, "//div[@class = 'freebirdFormeditorViewTabResponsesViewTabContent']/div[text()='#{tab_name}']").click
  end

  # Method that returns the text of a label
  # @param label, field label name
  # @return label text
  def ContactInformation.get_text(label)
    return find(:xpath, "//span[text()='#{label}']/ancestor::div[@class='SummaryHeaderContainer']"\
                        "//following-sibling::div[@class='freebirdFormeditorViewResponsesSummaryChartContainer']").text
  end

  def ContactInformation.get_confirmation_message
    return find(:xpath, "//div[@class='freebirdFormviewerViewResponseConfirmationMessage']").text
  end
end
