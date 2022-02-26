Dado('acesso o página de cadastro') do
    visit "/auth/signup/candidates"
    #Validação de cookie
    expect(page).to have_text "Sua privacidade"
    click_button "OK"
    #página de cadastro
    expect(page).to have_text "Cadastre-se"
end

Quando('preencho o formulário') do
    find("#displayName").set @name
    find("#email").set @email
    find("#password").set "Abcdefgh1@@"
    find(:id, "privacy.gpdr", visible:false).click(0, 0)
    click_button "Inscreva-se"
end

Quando('sou redirecionado para completar o perfil') do
    expect(page).to have_text "QUAL O SEU NOME COMPLETO?"
    expect(page).to have_text "QUAIS CARREIRAS VOCÊ ESTÁ BUSCANDO?"
    expect(page).to have_text "INDIQUE SUAS HABILIDADES"
    #Selecionando a competência e adiocionando frameworks e conhecimento
    find(:id, "career-qa", visible: false).click(0, 0)
    find("#react-select-4-input").set "bdd"
    sleep 1.5
    find("#react-select-4-input").send_keys(:enter)
    sleep 0.5
    find("#react-select-4-input").set "cucum"
    sleep 0.5
    find("#react-select-4-input").send_keys(:enter)
    sleep 0.5
    find("#react-select-4-input").set "gherk"
    sleep 0.5
    find("#react-select-4-input").send_keys(:enter)
    #Tempo de experiência
    find(".rc-slider-mark-text:nth-child(2) > .mt-3").click
    #Informações pessoais
    find(:xpath, "//select[@id='preferences.job_search']").find('option', text: "Busco oportunidades para iniciar o trabalho imediatamente").select_option
    find(:xpath, "//input[@value='+55']").set @cel
    find(:xpath, "//input[@id='address.city']").set "São Paulo"
    click_button "Próximo"
    expect(page).to have_text "QUAIS COMUNIDADES VOCÊ FAZ PARTE?"
    expect(page).to have_text "A Coodesh apoia causas sociais"
    #Instutuição de ensino
    find("#react-select-2-input").set "Udem"
    sleep 0.5
    find("#react-select-2-input").send_keys(:enter)
    expect(page).to have_text "QUAL SUA RELAÇÃO COM A COMUNIDADE?"
    find(".custom-select").find('option', text: "Ex-aluno").select_option
    #Causas Sociais
    find("#react-select-3-input").set "Mulhe"
    sleep 0.5
    find("#react-select-3-input").send_keys(:enter)
    find("#react-select-3-input").set "Preserv"
    sleep 0.5
    find("#react-select-3-input").send_keys(:enter)
    find("#react-select-3-input").set "Anima"
    sleep 0.5
    find("#react-select-3-input").send_keys(:enter)
    #Informações e Orientação
    find("#race").find('option', text: "Pessoa Branca").select_option
    find("#gender").find('option', text: "Homem", match: :prefer_exact).select_option
    find("#sexual_orientation").find('option', text: "Heterossexual").select_option
    find(:xpath, "//select[@id='disabilities.type']").find('option', text: "Nenhuma").select_option
    #Fechar janela de sourvey
    if page.has_css?('._hj-2VQFG__styles__form:nth-child(2)', wait: 5)
        find(:xpath, "//button[@class='_hj-OO1S1__styles__openStateToggle']").click
    end
    click_button "Próximo"
end

Então('o cadastro é finalizado') do
    expect(page).to have_text "Scorecard"
    expect(page).to have_text "Responda o seu nível"
end

