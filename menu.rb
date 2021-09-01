require_relative 'render/name/table'
require_relative 'request/frequency/name'
require_relative 'person'

while true
  puts 'Informe um nome:'
  input = gets.chomp

  puts 'Até logo' if input == '0'
  break if input == '0'

  person = Person.new(name: input)
  data = Request::Frequency::Name.new(name: person.name).call
  Render::Name::Table.call(data)
  puts "\nDigite 0 para sair"
end
