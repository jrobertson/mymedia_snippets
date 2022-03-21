Gem::Specification.new do |s|
  s.name = 'mymedia_snippets'
  s.version = '0.2.0'
  s.summary = 'A MyMedia gem for publishing code snippets'
  s.authors = ['James Robertson']
  s.files = Dir['lib/mymedia_snippets.rb']
  s.add_runtime_dependency('mymedia-pages', '~> 0.5', '>=0.5.4')
  s.add_runtime_dependency('coderay', '~> 1.1', '>=1.1.3')
  s.signing_key = '../privatekeys/mymedia_snippets.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/mymedia_snippets'
end
