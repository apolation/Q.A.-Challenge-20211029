Quando('acesso a página de login pelo botão') do
    click_button "Login"
end
  
Então('sou redirecionado para página de login') do
    expect(page).to have_text "Faça o login"
    expect(page).to have_text "Não possui conta? Cadastre-se"
end