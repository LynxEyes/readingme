module Readingme
  class Converter

    class << self
      def call input=$stdin, output=$stdout
        encoded = input.read
        converted = PandocRuby.convert(encoded, {from: :markdown, to: :html}, 'ascii')
        output.write converted
      end
    end

  end # class Converter
end # module Readingme
