#!/usr/bin/env ruby

# file: mymedia_snippets.rb

require 'coderay'
require 'mymedia-pages'


class MyMediaSnippets < MyMediaPages

  #def initialize(media_type: media_type='snippets', public_type: @public_type=media_type, 
  #            config: 'mymedia.conf', css_href: '/snippets/coderay_ruby.css', lang: :ruby, 
  #            log: nil, debug: false)
  def initialize(media_type: media_type='snippets', public_type: @public_type=media_type, config: 'mymedia.conf', css_href: '/snippets/coderay_ruby.css', lang: :ruby, log: nil, debug: false)
    
    
    super(media_type: media_type, public_type: public_type, config: config, 
          log: log, debug: debug)
    #super(media_type: media_type, config: config,)
    @css_href = css_href
    @lang = lang

  end

  def modify_xml(doc,filepath)

    puts 'mymedia_snippets inside modify_xml()' if @debug
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
  
  def writecopy_publish(s, filename=Time.now.strftime('s%d%m%yT%H%M.txt'))
    puts 'MyMediaSnippets inside writecopy_publish' if @debug
    super(s,filename)
  end  

end


class SnippetsTester23 < MyMediaSnippets
  
  include PagesTestSetup
  # it is assumed this class will be executed from a test directory 
  # containing the following auxillary files:
  #  - snippets.xsl
  #  - index-template.html
  
  def initialize(config: '', cur_dir:  '', www_dir: '/tmp/www', 
                 media_dir: '/tmp/media', debug: false)
        
    super(config: config, debug: debug)    
    set_paths(cur_dir, www_dir, media_dir)    
    
  end

end
