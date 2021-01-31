*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables  ***
${URL_SITE}                        http://parodify.qaninja.com.br/
${CADASTRO_BTN_EXPERIMENTE}        css=a[class*='button is-m']
${BTN_CADASTRAR}                   css=input[class*='fullwidth']
${MSG_ESPERADA}                    css=div[class='message-body']

*** Keywords ***
###Case 1: Cadastrar usuário
Dado que eu esteja na página inicial do site
    Go To    ${URL_SITE}
    Wait Until Element Is Visible    ${CADASTRO_BTN_EXPERIMENTE}
    Click Element                    ${CADASTRO_BTN_EXPERIMENTE}

Quando realizado meu cadastro com: "${EMAIL}" e "${SENHA}"
    Wait Until Element Is Enabled    id=user_email
    Input Text      id=user_email                     ${EMAIL}
    Input Text      id=user_password                  ${SENHA}
    Input Text      id=user_password_confirmation     ${SENHA}
    Click Button    ${BTN_CADASTRAR}

Então devo ser redirecionado para a área logada
    Wait Until Element Is Enabled    css=i[class*='has-text-white-bis']
    Page Should Contain    Tocadas Recentemente

##Case 3: Cadastrar usuário sem SENHA
Quando realizo o cadastro apenas com o email: "${EMAIL}"
    Wait Until Element Is Enabled    id=user_email
    Input Text      id=user_email                     ${EMAIL}
    Click Button    ${BTN_CADASTRAR}

Então verei a mensagem: "${MENSAGEM}"
    Wait Until Element Is Visible      ${MSG_ESPERADA}
    Page Should Contain    ${MENSAGEM}

##Case 4: Cadastrar usuário sem EMAIL
Quando realizo o cadastro apenas com o "senha"
    Wait Until Element Is Enabled    id=user_email
    ${SENHA}      Generate Random String   8   [LOWER]
    Input Text      id=user_password                  ${SENHA}
    Click Button    ${BTN_CADASTRAR}


##Case 5: Cadastro sem dados necessários
Quando submeto o cadastro sem os dados necessários
    Wait Until Element Is Enabled    id=user_email
    Click Button    ${BTN_CADASTRAR}


###Case 6: Cadastro com senha divergente
Quando submeto o cadastro com senha divergente
    Wait Until Element Is Enabled    id=user_email
    Input Text      id=user_email                     juliano@gmail.com
    Input Text      id=user_password                  a123
    Input Text      id=user_password_confirmation     a321
    Click Button    ${BTN_CADASTRAR}
