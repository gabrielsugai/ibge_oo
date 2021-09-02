module Render
  module Name
    class Table
      attr_reader :data

      def initialize(data:)
        @data = data
      end

      def call
        header
        body
      end

      private

      def header
        puts "Decadas | Frequencia de uso"
      end

      def body
        data.each do |frequency|
          puts "#{frequency[:periodo].ljust(7)} | #{frequency[:frequencia]}"
        end
      end
    end
  end
end
