#language: pt


Funcionalidade: Cadastro de novo usuário
    Cadastrar


    @signup
    Cenário: Cadastro novo usuário

        Dado acesso o página de cadastro
        Quando preencho o formulário
        E sou redirecionado para completar o perfil
        Então o cadastro é finalizado