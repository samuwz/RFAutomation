*** Settings ***
Documentation       Aqui neste arquivo está a resolução do Caso de Teste 02:
...                 Pesquisar Produto Não Existente


Library         SeleniumLibrary

Test Setup      Abrir Navegador 
Test Teardown   Fechar Navegador

*** Variables ***

${URL}          http://automationpractice.com/index.php
${BROWSER}      chrome


*** Keywords ***

Abrir Navegador
    Open Browser                        browser=${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser

Acessar a página home do site Automation Practice

    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Digitar o nome do produto "${PNE}" no campo de pesquisa

    Input Text                          id=search_query_top     ${PNE}

Clicar no botão pesquisar

    Click Element                       xpath=//*[@name='submit_search' and @type='submit']

Conferir mensagem "No results were found for your search"itemNãoExistente""

    Wait Until Element Is Visible       id=center_column
    Title Should Be                     Search - My Store
    Page Should Contain Element         xpath=/html/body/div/div[2]/div/div[3]/div[2]/p


***Test Cases ***

Caso de Teste 02: Pesquisar produto não Existente

    Acessar a página home do site Automation Practice
    Digitar o nome do produto "item Não Existente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""

# 'python -m robot testeWeb/webautomation2.robot'