When(/^I fill contact Information form with the following info$/) do |data_table|
  @hash_object = {}
  data_table.hashes.each do |row_contact_info|
    contact_info = ContactEntity.new(row_contact_info)
    contact_info.create_object(row_contact_info)
    @hash_object[row_contact_info['Obj Reference']] = contact_info
  end
end

Then(/^I should see the following info in the response section for %\{(.*?)\}$/) do |response_info|
  expected_value = @hash_object[response_info]
  expected_value.instance_variables.each do |attribute|
    label = Utility.capitalize_attribute(attribute)
    expect(expected_value.instance_variable_get(attribute)).to eql(ContactInformation.get_text(label))
  end
end

Then(/^I select form to click "([^"]*)" tab$/) do |tab_name|
  FormsPage.select_form('Contact Information')
  ContactInformation.click_tab(tab_name)
  puts ContactInformation.get_count_responses
  expect(ContactInformation.get_count_responses).to eql('1 response')
end
