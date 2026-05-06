*** Settings ***
Library    SeleniumLibrary

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
    Given I access the Organo website
    And I fill in the form fields
    And I click the 'Criar Card' button
    Then I should see the card in expected team

*** Keywords ***
Given I access the Organo website
	  Open Browser    url=http://localhost:3000    browser=Chrome

And I fill in the form fields
    Input Text	  ${FIELD_NOME}    Thiago
    Input Text    ${FIELD_CARGO}    Developer
    Input Text    ${FIELD_IMAGEM}    https://www.devthiart.com/images/thiago-andre.jpg
    Click Element    ${FIELD_TIME}
    Click Element    ${PROGRAMACAO}

And I click the 'Criar Card' button
    Click Element    ${SUBMIT_CARD}

Then I should see the card in expected team
    Element Should Be Visible    class:colaborador
