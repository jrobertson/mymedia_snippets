Gem::Specification.new do |s|
  s.name = 'mymedia_snippets'
  s.version = '0.1.1'
  s.summary = 'A MyMedia gem for publishing code snippets'
  s.authors = ['James Robertson']
  s.files = Dir['lib/mymedia_snippets.rb']
  s.add_runtime_dependency('mymedia-pages', '~> 0.2', '>=0.2.1')
  s.add_runtime_dependency('coderay', '~> 1.1', '>=1.1.2')
  s.signing_key = '../privatekeys/mymedia_snippets.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/mymedia_snippets'
end
