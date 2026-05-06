*** Settings ***
Library          SeleniumLibrary
Resource         ./setup_teardown.robot
Test Setup       Given I access the Organo website
Test Teardown    End test case

*** Variables ***

*** Test Cases ***

*** Keywords ***

