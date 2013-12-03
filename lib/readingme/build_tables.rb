# !/usr/bin/env ruby
module Readingme
  class TableProcessor

    # =============================================================================
    class << self
      def process input=$stdin, output=$stdout
        tab_proc = self.new
        input.each do |line|
          output.puts tab_proc.process_line(line)
        end
      end
    end

    # =============================================================================
    def initialize
      @state = :normal
    end

    STATE_TRANSITIONS = {
      :normal => :header,
      :header => :body,
      :body   => :normal
    }

    # =============================================================================
    def process_line line
      if line =~ /^\!table$/
        start_stop
      else
        process_table_line line
      end
    end

    private
      # =============================================================================
      def wrap_line line
        wrapped_line = line.scan(/[^|]+/).map(&:strip).
                            reduce("") do |acc, data|
                              acc << wrap(data)
                            end
        "<tr>#{wrapped_line}</tr>"
      end

      # =============================================================================
      def wrap data
        elem = @state == :header ? "th" : "td"
        "<#{elem}>#{data}</#{elem}>"
      end

      # =============================================================================
      def change_state
        @state = STATE_TRANSITIONS[@state]
      end

      # =============================================================================
      def start_stop
        change_state
        @state != :normal ? "<table>" : "</table>"
      end

      # =============================================================================
      def process_table_line line
        return line if @state == :normal

        if line =~ /^ {4,}[-+]+$/
          change_state
          ""
        else
          wrap_line line
        end
      end

  end # class TableProcessor
end # module Readingme

#------------------------------------

input  = ARGV[0] ? File.open(ARGV[0], "r") : $stdin
output = ARGV[1] ? File.open(ARGV[1], "w") : $stdout

Readingme::TableProcessor.process input, output
input.close
output.close
