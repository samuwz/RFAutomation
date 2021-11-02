*** Settings ***

Documentation       Aqui neste arquivo está a resolução do Caso de Teste 03:
...                 Listar Produtos

Library             SeleniumLibrary

Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador


*** Variables ***

${URL}          http://automationpractice.com/index.php
${BROWSER}      chrome


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

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias

    Mouse Over                              xpath=//*[@id="block_top_menu"]/ul/li[1]/a
    
Clicar na sub categoria "Summer Dresses"

    Click Element                           xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

    Wait Until Element Is Visible           id=center_column
    Title Should Be                         Summer Dresses - My Store
    Page Should Contain Image               xpath=//*[@id='center_column']//*[@src='http://automationpractice.com/img/p/1/2/12-home_default.jpg']


*** Test Cases ***

Caso de Teste 03: Listar Produtos

    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

# 'python -m robot testeWeb/webautomation3.robot'