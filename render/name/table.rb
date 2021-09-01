module Render
  module Name
    class Table

      def self.call(data)
        header
        body(data)
      end

      def self.header
        puts "Decadas | Frequencia de uso"
      end

      def self.body(data)
        data.each do |frequency|
          puts "#{frequency[:periodo].ljust(7)} | #{frequency[:frequencia]}"
        end
      end
    end
  end
end
