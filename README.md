# Introducing the MyMedia Snippets gem

    require 'mymedia_snippets'

    class JRSnippets < MyMediaSnippets

      def initialize(media_type: 'snippets', 
                config: '/home/james/jamesrobertson.eu/s1/mymedia.conf', 
                     css_href: '/snippets/coderay_ruby.css', lang: :ruby)
        
        super(media_type: media_type, config: config, css_href: css_href, lang: lang)

      end

    end

    conf = args.first
    JRSnippets.new(config: conf).auto_copy_publish

In the above example the MyMedia Snippets gem retrieves the most recent file in the directory */home/james/media/snippets* directory and publishes it to an HTML file on my webserver which is accessible from a local file directory using SSHFS.

This file was published using MyMedia Snippets gem.

## Resources

* ?mymedia_snippets https://rubygems.org/gems/mymedia_snippets?
* ?Creating a Metadata File using the MyMedia-card Gem http://www.jamesrobertson.eu/snippets/2015/may/04/creating-a-metadata-file-using-the-mymedia-card-gem.html?

mymedia snippets gem
