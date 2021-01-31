*** Settings ***
Resource         ../PO/PO_cadastro_usuario.robot
Library     SeleniumLibrary
Library     String

*** Variables ***
${BTN_BUSCA}      css=a[href*='search']
${ID_BUSCA}       id=search
${OPCAO_MUSICA}   css=a[target*='songs']
${BTN_PLAY}       css=i[class='fas fa-play-circle fa-2x']
${BTN_PAUSA}      css=i[class='fas fa-2x fa-pause-circle']

*** Keywords ***
##Case 2: Buscar por música
Quando busco pela música "${MUSICA}"
    Quando realizado meu cadastro com: "juliano@gmail.com" e "psw123"
    Wait Until Element Is Visible    ${BTN_BUSCA}
    Click Element        ${BTN_BUSCA}
    Wait Until Element Is Visible    ${ID_BUSCA}
    Input Text      ${ID_BUSCA}      ${MUSICA}
    Press Keys      ${ID_BUSCA}      ENTER
    Wait Until Element Is Visible    ${OPCAO_MUSICA}
    Click Element                    ${OPCAO_MUSICA}

Então a música será tocada
  Wait Until Element Is Visible    ${BTN_PLAY}
  Click Element                    ${BTN_PLAY}
