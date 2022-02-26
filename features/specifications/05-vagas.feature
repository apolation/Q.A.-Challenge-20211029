#language: pt


Funcionalidade: Vagas
    Pesquisa de Vagas


    @vagas
    Cenário: Fazer busca de vagas disponível

        Dado que estou logado como "matheusteste@teste.com" e "Abcdefgh1@@"
        Quando faço buscas por vagas
        Então vejo os resultados exibidos