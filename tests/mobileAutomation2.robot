*** Settings ***
Documentation        Aqui neste arquivo estarão presentes os cenários e keywords que dizem respeito
...                  a automação mobile.

Library              AppiumLibrary

Test Setup           Abrir aplicativo
Test Teardown        Fechar aplicativo

*** Keywords ***

Abrir aplicativo
    Open Application                  http://localhost:4723/wd/hub
    ...                               automationName=uiautomator2
    ...                               deviceName=0054686084
    ...                               platformName=Android
    ...                               autoGrantPermissions=true
    ...                               appPackage=com.google.android.youtube
    ...                               appActivity=com.google.android.youtube.HomeActivity
    
Fechar aplicativo
    Close Application

Dado que o cliente esteja na tela de Home
    Wait Until Element Is Visible                id=youtube_logo
    Element Attribute Should Match               xpath=//android.widget.Button[@content-desc="Início"]/android.widget.ImageView           selected        True             

E pesquise um vídeo sobre "${BUSCA}"
    Click Element                 accessibility_id=Pesquisar
    Input Text                    id=search_edit_text                ${BUSCA}
    Press Keycode                 66

E acessar o canal da Prime
    Wait Until Element Is Visible            accessibility_id=Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 245 visualizações - há 1 ano - assistir o vídeo
    Click Element                            xpath=//android.view.ViewGroup[@content-desc="Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 245 visualizações - há 1 ano - assistir o vídeo"]/child::*[@content-desc='Ir ao canal']

Quando clicar em Inscrever-se
    Wait Until Element Is Visible            accessibility_id=Inscreva-se em Prime Control.
    Click Element                            accessibility_id=Inscreva-se em Prime Control.

Então será apresentado como Inscrito
    Wait Until Element Is Visible            accessibility_id=Cancelar inscrição de Prime Control.

*** Test Cases ***
Caso de Teste 01
    Dado que o cliente esteja na tela de Home
    E pesquise um vídeo sobre "Prime Experts"
    E acessar o canal da Prime
    Quando clicar em Inscrever-se
    Então será apresentado como Inscrito
