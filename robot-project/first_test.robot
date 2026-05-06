*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open browser and access Organo Website
	Open Browser    url=http://localhost:3000    browser=Chrome

Fill in the form fields.
	Input Text	  id:form-nome    Thiago
	Input Text    id:form-cargo    Developer
	Input Text    id:form-imagem    https://www.devthiart.com/images/thiago-andre.jpg
	Click Element    class:lista-suspensa
	Click Element    //option[contains(.,'Programação')]
	Sleep    5s
	Click Element    id:form-botao
	Element Should Be Visible    class:colaborador
	Sleep    5s
