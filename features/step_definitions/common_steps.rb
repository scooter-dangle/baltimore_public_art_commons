Given(/^I am logged in as an "(.*?)" user$/) do |user|
  @user = FactoryGirl.create :"#{user}"
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

Then(/^I should see a success message$/) do
  expect(page).to have_content("Success!")
end

When(/^I fill out the form$/) do |form_info|
  form_info.hashes.map(&:values).each do |field_name, value|
    fill_in field_name, with: value
  end
end

When(/^I enter (\w+) as '(.+)'$/) do |field_name, value|
  fill_in field_name, with: value
end

When(/^I select '([^']+)' from '([^']+)'$/) do |selection, source|
  select selection, from: source
end

When(/^I press '(.+)'$/) do |button_name|
  click_button button_name
end
