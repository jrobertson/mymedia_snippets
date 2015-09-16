#!/usr/bin/env ruby

# file: mymedia_snippets.rb

require 'coderay'
require 'mymedia-pages'


  class MyMediaSnippets < MyMediaPages

    def initialize(media_type: 'snippets', config: 'mymedia.conf',
                           css_href: '/snippets/coderay_ruby.css', lang: :ruby)
      
      super(media_type: media_type, config: config)
      
      @css_href = css_href
      @lang = lang

    end

    def modify_xml(doc,filepath)

      super do |doc|

        r = doc.root.xpath('//pre/code')

        r.each do |node|

          parent = node.parent

          xml = CodeRay.scan(node.text.unescape, @lang).div(:css => :class)

          doc_code = Rexle.new(xml.sub('code>',"code>\n"))
          parent.insert_before doc_code.root
          parent.delete  
        end

        doc
      end

    end
    
    def add_css_js(xml)
      xml.link({rel: 'stylesheet', type: 'text/css', \
          href: @css_href, media: 'screen, projection, tv'},'')
    end

end
