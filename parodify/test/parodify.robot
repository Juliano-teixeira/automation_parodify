*** Settings ***
Resource            ../resource/resource.robot
Resource            ../PO/PO_cadastro_usuario.robot
Resource            ../PO/PO_Busca_musica.robot
Test Setup          Abrir navegador e conectar a API
Test Teardown       Fechar navegador

*** Test case ***
Case 1: Cadastrar usuário
    [tags]    cadastrar_usuario
    PO_cadastro_usuario.Dado que eu esteja na página inicial do site
    PO_cadastro_usuario.Quando realizado meu cadastro com: "juliano@gmail.com" e "psw123"
    PO_cadastro_usuario.Então devo ser redirecionado para a área logada

Case2: Buscar por música
    [tags]    busca_musica
    PO_cadastro_usuario.Dado que eu esteja na página inicial do site
    PO_Busca_musica.Quando busco pela música "bug de manhã"
    Então a música será tocada

Case 3: Cadastrar usuário sem SENHA
    [tags]    usuario_sem_senha
    PO_cadastro_usuario.Dado que eu esteja na página inicial do site
    PO_cadastro_usuario.Quando realizo o cadastro apenas com o email: "juliano@gmail.com"
    Então verei a mensagem: "Oops! Informe sua senha."

Case 4: Cadastrar usuário sem EMAIL
    [tags]    usuario_sem_email
    PO_cadastro_usuario.Dado que eu esteja na página inicial do site
    Quando realizo o cadastro apenas com o "senha"
    Então verei a mensagem: "Oops! Informe seu email."

Case 5: Cadastro sem dados necessários
    [tags]    cadastro_em_branco
    PO_cadastro_usuario.Dado que eu esteja na página inicial do site
    PO_cadastro_usuario.Quando submeto o cadastro sem os dados necessários
    Então verei a mensagem: "Oops! Informe seu email e sua senha."

Case 6: Cadastro com senha divergente
    [tags]    senha_divergente
    PO_cadastro_usuario.Dado que eu esteja na página inicial do site
    Quando submeto o cadastro com senha divergente
    Então verei a mensagem: "Oops! Senhas não são iguais."
