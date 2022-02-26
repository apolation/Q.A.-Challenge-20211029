#language: pt


Funcionalidade: Cadastro de novo usuário com rede social
    Cadastrar


    @signup-social
    Cenário: Cadastro usando rede social

        Dado acesso o página de cadastro
        Quando faço cadastro com conta de rede social
        Então sou redirecionado para o dashboard