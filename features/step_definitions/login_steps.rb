############################    Authentication   #############################
Given(/^I log in as "([^"]*)"$/) do |user|
  login_page.log_in(user)
end
