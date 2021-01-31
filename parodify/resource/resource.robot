*** Settings ***
Library           SeleniumLibrary
Library           String
Library           RequestsLibrary
Library           Collections


*** Variables ***
${NAVEGADOR}                      chrome
${URL_SITE}                       http://parodify.qaninja.com.br/
${CADASTRO_BTN_EXPERIMENTE}        css=a[class*='button is-m']
${URL_API}                         http://parodify.qaninja.com.br/

*** Keywords ***
Abrir navegador e conectar a API
    Open Browser  about:blank   ${NAVEGADOR}
    Maximize Browser Window
    Create Session    apiQa    ${URL_API}
    ${RETONO_API}     Get Request    apiQa    helpers?email=juliano@gmail.com
    Log   ${RETONO_API.text}

Fechar navegador
    Close Browser

###Case 1: Cadastrar usuário
Dado que eu esteja na página inicial do site
    Go To    ${URL_SITE}
    Wait Until Element Is Visible    ${CADASTRO_BTN_EXPERIMENTE}
    Click Element                    ${CADASTRO_BTN_EXPERIMENTE}
