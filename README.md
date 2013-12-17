# Readingme

Small Markdown to HTML encoder which uses Github readme stylesheet and highlight.js

## Installation

Add this line to your application's Gemfile:

    gem 'readingme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install readingme

## Usage

On your projects root dir, just run

    $ readingme

Any markdown file (with `.md` extension) will be converted to html everytime you make changes to it.

You can also have readingme following just one file (`README.md` for example).
To achieve this you just need to pass the filename as an argument, as:

    $ readingme README.md

This will only look at `README.md`, ignoning any other markdown files you may have.

---

If you use a browser with auto-reload (such as epiphany) this is specially nice since all you need to do when editing your `.md` files is save them and the browser will automagically load up the new version of it.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
