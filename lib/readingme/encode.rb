#!/usr/bin/env ruby

module Readingme
  class Encoder
    # =============================================================================
    class << self
      def process input=$stdin, output=$stdout
        encoder = self.new

        input.each do |line|
          output.puts encoder.process_line(line)
        end
      end
    end

    EMPTY_LINE = /\A$\Z/
    PRE_LINE   = /( {4,}|\!table|`{3})/

    # =============================================================================
    def initialize
      @prev_line = nil
      @pre_mode = :off
      @entities = HTMLEntities.new
    end

    # =============================================================================
    def start_stop line
      if @pre_mode == :off && @prev_line =~ EMPTY_LINE && line =~ PRE_LINE
        @pre_mode = :on
      elsif @pre_mode == :on && @prev_line =~ PRE_LINE && line =~ /\A$\Z|[^ ]+/
        @pre_mode = :off
      end
    end

    # =============================================================================
    def process_line line
      start_stop line

      r_line =  if @pre_mode == :off
                  @entities.encode(line, :named).
                            gsub("&lt;", "<").
                            gsub("&gt;", ">").
                            gsub("&quot;", "\"")
                else
                  line
                end
      @prev_line = line

      r_line
    end

  end # class Encoder
end # module Readingme

#------------------------------------
input  = ARGV[0] ? File.open(ARGV[0], "r") : $stdin
output = ARGV[1] ? File.open(ARGV[1], "w") : $stdout

Readingme::Encoder.process input, output
input.close
output.close

