require "capybara"
require "capybara/cucumber"
require "cep_brasil"
require 'cpf_faker'
require 'cucumber'
require 'faker'
require 'httparty'
require 'pry-nav'
require 'rspec'
require 'selenium-webdriver'

#Esse comando é para fazer o selenium usar o CHROME, quando não temos o firefox instalado.
Capybara.register_driver :selenium_chrome do |app| 
    Capybara::Selenium::Driver.new(app, :browser => :chrome) 
end

# Esse comando é para o selenium abrir o chrome.
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    #config.default_driver = :selenium_chrome_headless
  
    #'.app_host' é um comando para definir um endereço de página padrão.
    config.app_host = "https://beta.coodesh.com"
    config.default_max_wait_time = 10
end