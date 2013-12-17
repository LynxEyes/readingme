require "htmlentities"
require 'pandoc-ruby'

require "readingme/version"

module Readingme
  # Your code goes here...
  APP_ROOT = File.expand_path("../..", __FILE__)
end

require 'readingme/pipelines'
require 'readingme/table_processor'
require 'readingme/encoder'
require 'readingme/converter'
require 'readingme/github_wrapper'
