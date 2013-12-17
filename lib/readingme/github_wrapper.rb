module Readingme
  class GithubWrapper

    class << self
      def call input=$stdin, output=$stdout
        stylesheet = "#{Readingme::APP_ROOT}/assets/readme.css"
        output.puts <<-HTML
          <!DOCTYPE html>
          <html>
            <head>
              <style type="text/css">#{File.read(stylesheet)}</style>
              <link rel="stylesheet" href="http://yandex.st/highlightjs/7.5/styles/default.min.css">
              <script src="http://yandex.st/highlightjs/7.5/highlight.min.js"></script>
              <script>hljs.initHighlightingOnLoad();</script>
            </head>
            <body>
              <div id="readme">
                <div class="markdown-body">#{input.read}</div>
              </div>
            </body>
          </html>
        HTML
      end
    end

  end # class GithubWrapper
end # module Readingme

# -----------------------------------------------------------------------------
# input  = ARGV[0] ? File.open(ARGV[0], "r") : $stdin
# output = ARGV[1] ? File.open(ARGV[1], "w") : $stdout

# Readingme::GithubWrapper.process input, output
# input.close
# output.close
