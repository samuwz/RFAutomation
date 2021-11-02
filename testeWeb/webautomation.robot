*** Settings ***

Documentation       Aqui neste arquivo está a resolução do Caso de Teste 01:
...                 Pesquisar Produto Existente

Library             SeleniumLibrary

Test Setup          Abrir Navegador 
Test Teardown       Fechar Navegador


***Variables***

${URL}              http://automationpractice.com/index.php 
${BROWSER}          chrome


*** Keywords ***

Abrir Navegador 

    Open Browser                            browser=${BROWSER}
    Maximize Browser Window

Fechar Navegador

    Capture Page Screenshot
    Close Browser

Acessar a página home do site Automation Practice

    Go To                                   ${URL}  #define em ***variables*** par facilitar se precisar alterar
    Title Should Be                         My Store  #titulo da pagina
    Wait Until Element Is Visible           id=block_top_menu  #inpecionar - id (cada id no html precisa ser unico para facilitar automação)

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa

    Input Text                              id=search_query_top     ${PRODUTO}  

Clicar no botão pesquisar

    Click Element                           xpath=//*[@name='submit_search' and @type='submit']

Conferir se o produto "${PRODUTO}" foi listado no site

    Wait Until Element Is Visible           id=center_column
    Title Should Be                         Search - My Store
    Page Should Contain Image               xpath=//*[@id='center_column']//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']


*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente

    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

# 'python -m robot testeWeb/webautomation.robot'

