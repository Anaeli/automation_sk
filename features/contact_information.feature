@contact
Feature: Contact information form

#  Scenario: Fill contact information form
#    Given login

  Scenario: Fill contact information form
    Given login with Contact User
    And  I access the link to fill form
    When  I fill contact Information form with the following info
      | Name      | email              | Address          |Obj Reference|
      | Test User | mail.test@mail.com | Av. Siempre viva | @c_info            |
    Then I should see the following info in the response section for %{@c_info}