Then (/^I fill out the form$/) do
  fill_in 'Email', with: 'new@user.com'
  fill_in 'User Type', with: 'curator'
  click_button 'Invite'
end
