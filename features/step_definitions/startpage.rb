Dado('que acesso a homepage') do
    visit "/"
    #Validação de cookie
    expect(page).to have_text "Sua privacidade"
    click_button "OK"
end

Então('a página é carregada com sucesso') do
    #validação de homepage
    expect(page).to have_text "Conectamos\ndevelopers validados\nàs empresas"
end