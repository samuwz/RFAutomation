*** Settings ***

Documentation       Aqui neste arquivo está a resolução do Caso de Teste 04:
...                 Adicionar Cliente

Library             SeleniumLibrary
Library             FakerLibrary

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador


*** Variables ***

${URL}              http://automationpractice.com/index.php
${BROWSER}          chrome 
${PASSWORD}         primehero123
${POSTALCODE}       00000
${MOBILE}           99999999
${ADDRESS}          Endereço


*** Keywords ***

Abrir Navegador

    Open Browser                            browser=${BROWSER}
    Maximize Browser Window

Fechar Navegador

    Capture Page Screenshot
    Close Browser

Acessar a página home do site

    Go To                                   ${URL}
    Title Should Be                         My Store
    Wait Until Element Is Visible           id=block_top_menu

Clicar em "Sign in"

    Click Element                           xpath=/html/body/div/div[1]/header/div[2]/div/div/nav/div[1]/a
    
Informar um e-mail válido

    ${EMAIL}                                FakerLibrary.Email
    Wait Until Element Is Visible           xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul
    Title Should Be                         Login - My Store
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/div[1]/form/div/div[2]/input         ${EMAIL}

Clicar em "Create an account"

    Click Element                           xpath=/html/body/div/div[2]/div/div[3]/div/div/div[1]/form/div/div[3]/button/span

Preencher os dados obrigatórios

    ${FIRST_NAME}                           FakerLibrary.Name
    ${LAST_NAME}                            FakerLibrary.Name
    ${CITY}                                 FakerLibrary.City
    
    Wait Until Element Is Visible           xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[4]/button/span
    Title Should Be                         Login - My Store
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[1]/div[2]/input             ${FIRST_NAME}
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[1]/div[3]/input             ${LAST_NAME}
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[1]/div[5]/input             ${PASSWORD}
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[2]/p[4]/input               ${ADDRESS}
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[2]/p[6]/input               ${CITY}
    Click Element                           xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[2]/p[9]/div/select 
    Click Element                           xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[2]/p[7]/div/select/option[13]  
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[2]/p[8]/input               ${POSTALCODE}
    Input Text                              xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[2]/p[13]/input              ${MOBILE}

Submeter cadastro

    Click Element                           Xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[4]/button/span

Conferir se o cadastro foi efetuado com sucesso

    Wait Until Element Is Visible                       xpath=/html/body/div/div[2]/div/div[3]/div/ul/li/a/span
    Title Should Be                                     My account - My Store
    Page Should Contain Element                         xpath=/html/body/div/div[2]/div/div[3]/div/div/div[1]/ul/li[4]/a/span                              


*** Test Cases ***

Caso de Teste 04: Adicionar Cliente

    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso

# 'python -m robot testeWeb/webautomation4.robot'