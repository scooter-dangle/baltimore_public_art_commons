Given(/^an admin has invited me with confirmation hash #(.+)$/) do |confirmation_hash|
  user = User.create_invited_user({})
  user.confirmation_hash = confirmation_hash
  user.save!
end

When(/^I navigate to the invitation page for #(.+)$/) do |confirmation_hash|
  user = User.find_by(confirmation_hash: confirmation_hash)
  visit edit_user_url(user, token: confirmation_hash)
end
