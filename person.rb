require 'net/http'
require 'json'

class Person
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def get_frequency
    uri = URI("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{@name}")
    response = Net::HTTP.get(uri)
    response = JSON.parse(response, symbolize_names: true)
    r = response.first[:res].map { |r| "#{r[:periodo]} frequencia #{r[:frequencia]}"}
    r = r.map do |f| 
      aux = f.split('frequencia')
      aux = aux.map { |e| e.tr('[] ', '')}
    end
    puts "Decada | Frequencia de uso"
    r.each do |frequencia|
      decadas = frequencia[0].split(',')
      if decadas.size > 1
        a1 = decadas[0].scan(/../)[1]
        a2 = decadas[1].scan(/../)[1]
        decada = "#{a1}..#{a2}"
        puts("#{decada} | #{frequencia[1]}")
      else
        a1 = decadas[0].scan(/../)[1]
        puts("#{a1}     | #{frequencia[1]}")
      end
    end
  end
end
