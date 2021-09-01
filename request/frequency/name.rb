require 'net/http'
require 'json'

module Request
  module Frequency
    class Name
      attr_reader :name

      def initialize(name:)
        @name = name
      end

      def call
        parse_response
      end

      private

      def get_frequency
        uri = URI("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{name}")
        response = Net::HTTP.get(uri)
        response = JSON.parse(response, symbolize_names: true)
      end

      def parse_response
        response = get_frequency.first[:res]
        response.each do |data|
          data[:periodo] = parse_decade(data[:periodo])
        end
      end

      def parse_decade(period)
        decade = period.tr('[]', '').split(',')
        decade.map { |year| year.scan(/../).last }.join('..')
      end
    end
  end
end

