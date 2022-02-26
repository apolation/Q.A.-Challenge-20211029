Before do
    page.current_window.resize_to(1440, 900)
end

# Before do
#     Faker::Config.locale = 'pt-BR'
# end

Before do
    @name = Faker::Name.name
    @number = Faker::Number.number(digits: 3)
    @cel = Faker::PhoneNumber.cell_phone
    @email = Faker::Internet.email(name: "#{@name}" + "#{@number}", domain: 'gmail.com')
end
