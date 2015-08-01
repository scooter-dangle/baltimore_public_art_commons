Feature: User invites another user

  Background:
    Given I am logged in as an "admin" user
    And I am on the index page

  Scenario: A user wants to invite another user
    When I click the "Invite User" link
    And I enter Email as 'new@user.com'
    And I select 'curator' from 'Role'
    And I press 'Invite'
    Then I should see a success message
