Given(/^I am logged in as an admin user$/) do
  @user = FactoryGirl.create :admin
  visit('/login')
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: "password"
  click_button 'Login'
  expect(page).to have_content('Invite User')
end

Given(/^I am on the index page$/) do
  visit('/')
end


When(/^I click the "(.*?)" link$/) do |arg1|
  click_link arg1
end
