Feature: User is invited
  Background:
    Given an admin has invited me at 'new@user.com' with confirmation hash #111000

  Scenario: A user uses a confirmation hash to create their account
    When I navigate to the invitation page for #111000
    And I fill out the form
      | field_name            | value        |
      | first_name            | User         |
      | last_name             | Smith        |
      | password              | drowssap     |
      | password_confirmation | drowssap     |
      | email                 | new@user.com |
    And I press 'Submit'
    Then I should see a success message
