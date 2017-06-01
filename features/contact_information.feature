@contact
Feature: Contact information form

#  Scenario: Fill contact information form
#    Given login

  Scenario: Fill contact information form

    Given I log in as "User B"
    When  I fill contact Information form with the following info
      | Name      | email              | Address          |Obj Reference|
      | Test User | mail.test@mail.com | Av. Siempre viva | @c_info            |


    Given I log in as "User A"
    When I select form to click "Responses" tab
    Then I should see the following info in the response section for %{@c_info}