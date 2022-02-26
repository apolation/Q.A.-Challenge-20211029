Quando('faço cadastro com conta de rede social') do
    #Logar com Google
    #janela popup de login
    new_window = window_opened_by do
        click_button "Google"
    end
        
    within_window new_window do
        expect(page).to have_text "Fazer login"
        expect(page).to have_text "Prosseguir para "
        find("#identifierId").set "matheustestes4321@gmail.com"
        click_button "Próxima"
        expect(page).to have_text "Olá!"
        find(:xpath, "//input[@type='password']").set "VefuBah5ksLPZzz"
        click_button "Próxima"
    end
end

Entao('sou redirecionado para o dashboard') do
    expect(page).to have_css ".dashboard"
end