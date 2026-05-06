*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Given I access the Organo website
	  Open Browser    url=http://localhost:3000    browser=Chrome

End test case
    Close Browser 
