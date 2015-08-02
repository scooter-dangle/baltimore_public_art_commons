Feature: User is invited
  Background:
    Given an admin has invited me at 'new@user.com' with confirmation hash #111000

  Scenario: A user uses a confirmation hash to create their account
    When I navigate to the invitation page for #111000
    And I fill out the form
      | field_name                 | value        |
      | user_first_name            | User         |
      | user_last_name             | Smith        |
      | user_password              | drowssap     |
      | user_password_confirmation | drowssap     |
      | user_email                 | new@user.com |
    And I press 'Submit'
    Then I should see a success message
