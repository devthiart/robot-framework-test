*** Settings ***
Resource    ../main.robot

*** Variables ***
${FIELD_NOME}      id:form-nome
${FIELD_CARGO}     id:form-cargo
${FIELD_IMAGEM}    id:form-imagem
${FIELD_TIME}      class:lista-suspensa
${SUBMIT_CARD}     id:form-botao 
@{Select_times}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação')]

*** Keywords ***
Given I fill in the form fields
    ${Nome}       FakerLibrary.First Name
    Input Text	  ${FIELD_NOME}    ${Nome}
    ${Cargo}      FakerLibrary.Job
    Input Text    ${FIELD_CARGO}    ${Cargo}
    ${Imagem}    FakerLibrary.Image Url
    Input Text    ${FIELD_IMAGEM}    ${Imagem}
    Click Element    ${FIELD_TIME}
    Click Element    ${Select_times}[0]

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

Then create 1 card in each available team
    FOR    ${index}    ${time}    IN ENUMERATE    @{Select_times}
        Log    ${index}:${time}
        Given I fill in the form fields
        Click Element    ${time}
        And I click the 'Criar Card' button
    END
    Sleep    10s

Given I leave a required field empty and click the 'Criar Card' button
    Click Element    ${SUBMIT_CARD}

Then I should see the required field error message
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
