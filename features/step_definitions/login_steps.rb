############################    Authentication   #############################

Given(/^login$/) do
  login_page.log_in(EMAIL_ADMIN, PASSWORD_ADMIN)
  FormsPage.select_form
  ContactInformation.click_tab('Responses')
  puts ContactInformation.get_count_responses
  expect(ContactInformation.get_count_responses).to eql('0 responses')
end

Given(/^passed$/) do
  expect(true).to be true
end

