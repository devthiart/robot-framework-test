*** Settings ***
Library          SeleniumLibrary
Resource         ./setup_teardown.robot
Test Setup       Given I access the Organo website
Test Teardown    End test case

*** Variables ***
${SUBMIT_CARD}     id:form-botao 

*** Test Cases ***
Verify alert when required field is empt
    Given I leave a required field empty and click the 'Criar Card' button
    Then I should see the required field error message
