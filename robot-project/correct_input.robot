*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt-BR
Resource         ./setup_teardown.robot
Test Setup       Given I access the Organo website
Test Teardown    End test case

*** Test Cases ***
Verify that when the form is filled out correctly, the data is entered correctly into the list and that a new card is created in the expected time.
    Given I fill in the form fields
    And I click the 'Criar Card' button
    Then I should see the card in expected team

Verify if it is possible to create more than one card
    Given I fill in the form fields
    And I click the 'Criar Card' button
    Then three cards should be displayed in the expected team

Verify if it is possible to create a card for each available team by filling in the form correctly
    Given I fill in the form fields
    Then create 1 card in each available team


