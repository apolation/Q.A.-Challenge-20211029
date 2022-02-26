Dado('que estou logado como {string} e {string}') do |email, password|
    visit "/auth/signin/candidates"
    #Validação de cookie
    expect(page).to have_text "Sua privacidade"
    click_button "OK"
    #Área de Login
    expect(page).to have_text "Faça o login"
    expect(page).to have_text "Não possui conta? Cadastre-se"
    find("#email").set email
    find("#password").set password
    click_button "Entrar"
    #dashboard
    expect(page).to have_css ".dashboard"
    expect(page).to have_text "Escolha um perfil"
end

Quando('faço buscas por vagas') do
    #botão vagas
    find(:xpath, "//h3[contains(.,'Vagas')]").click
    expect(page).to have_text "Categoria:"
    expect(page).to have_text "Cidade, Estado ou Home-Office"
    #busca de vagas
    find(:xpath, "//input[@name='search']").set "Analista"
    find(:xpath, "//input[@name='location']").set "Remota"
    click_button "Encontrar"
end
  
Então('vejo os resultados exibidos') do
    expect(page).to have_text "Analista de Teste"
end