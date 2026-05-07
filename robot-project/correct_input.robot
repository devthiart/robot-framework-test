*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt-BR
Resource         ./setup_teardown.robot
Test Setup       Given I access the Organo website
Test Teardown    End test case

*** Variables ***
${FIELD_NOME}      id:form-nome
${FIELD_CARGO}     id:form-cargo
${FIELD_IMAGEM}    id:form-imagem
${FIELD_TIME}      class:lista-suspensa
${SUBMIT_CARD}     id:form-botao 
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]

*** Test Cases ***
Verify that when the form is filled out correctly, the data is entered correctly into the list and that a new card is created in the expected time.
    Given I fill in the form fields
    And I click the 'Criar Card' button
    Then I should see the card in expected team

Verify if it is possible to create more than one card
    Then three cards should be displayed in the expected team

*** Keywords ***
Given I fill in the form fields
    ${Nome}       FakerLibrary.First Name
    Input Text	  ${FIELD_NOME}    ${Nome}
    ${Cargo}      FakerLibrary.Job
    Input Text    ${FIELD_CARGO}    ${Cargo}
    ${Imagem}    FakerLibrary.Image Url
    Input Text    ${FIELD_IMAGEM}    ${Imagem}
    Click Element    ${FIELD_TIME}
    Click Element    ${PROGRAMACAO}

And I click the 'Criar Card' button
    Click Element    ${SUBMIT_CARD}

Then I should see the card in expected team
    Element Should Be Visible    class:colaborador

Then three cards should be displayed in the expected team
    FOR    ${i}    IN RANGE    1    3
        Given I fill in the form fields
        And I click the 'Criar Card' button
    END
    Sleep    5s
    
