source 'https://rubygems.org'

#ruby "2.1.5"

# Rails (internacionalización)
gem "rails", '~> 5.0.0'
gem "rails-i18n"

gem 'puma', '~> 3.0' 

# Problemas con arel 6.0.0 al ejecutar rspec
#gem "arel", '6.0.0.beta2'

# Colores en terminal
gem "colorize"

# Postgresql
gem "pg"

# API JSON facil. Ver: https://github.com/rails/jbuilder
gem "jbuilder"

gem "sass"
gem 'chosen'
gem 'font-awesome-rails'

gem 'libxml-ruby', '2.8.0' #https://github.com/xml4r/libxml-ruby/issues/127
gem "rspreadsheet"

# Uglifier comprime recursos Javascript
gem "uglifier", '>= 1.3.0'

# CoffeeScript para recuersos .js.coffee y vistas
gem "coffee-rails"

# jquery como librería JavaScript
gem "jquery-rails"
gem "jquery-ui-rails"

# Seguir enlaces más rápido. Ver: https://github.com/rails/turbolinks
gem "turbolinks", '2.5.3'

# Ambiente de CSS
gem "twitter-bootstrap-rails"#, '~> 3.2.0'
gem "bootstrap-datepicker-rails"

# Formularios simples 
gem "simple_form"

# Formularios anidados (algunos con ajax)
gem "cocoon", git: 'https://github.com/vtamara/cocoon.git'

# Autenticación y roles
gem "devise"
gem "devise-i18n"
gem "cancancan"
gem "bcrypt"

# Pagina listados
gem "will_paginate"

# ICU con CLDR
gem 'twitter_cldr'
 
# Maneja adjuntos
gem "paperclip"#, "~> 4.1"

# Zonas horarias
gem "tzinfo"
gem "tzinfo-data"

# Motor estilo Pasos de Jesús
gem 'sip', git: 'https://github.com/pasosdeJesus/sip.git'
#gem 'sip', path: '../sip'

# Motor de nube y plantillas
gem 'heb412_gen', git: 'https://github.com/pasosdeJesus/heb412_gen.git'
#gem 'heb412_gen', path: '../heb412_gen'

# Los siguientes son para desarrollo o para pruebas con generadores
group :development do
  # Requerido por rake
  gem "thor"
  
  # Depurar
  #gem 'byebug'
  
  # Consola irb en páginas con excepciones o usando <%= console %> en vistasA
  gem 'web-console'

end

# Los siguientes son para pruebas y no tiene generadores requeridos en desarrollo
group :test do
  # Acelera ejecutando en fondo. https://github.com/jonleighton/spring
  gem "spring"

  gem 'simplecov'
  # Envia resultados de pruebas desde travis a codeclimate
  gem "codeclimate-test-reporter"

  #gem 'byebug'

  gem "connection_pool"
  gem "minitest-reporters"

  gem 'rails-controller-testing'

  # Un proceso para cada prueba -- acelera

  gem 'spork'#, '~> 1.0rc'

  # Envia resultados de pruebas desde travis a codeclimate
  #gem "codeclimate-test-reporter", require: nil

  # https://www.relishapp.com/womply/rails-style-guide/docs/developing-rails-applications/bundler
  # Lanza programas para examinar resultados
  gem "launchy"


  # Para examinar errores, usar "rescue rspec" en lugar de "rspec"
  gem 'pry-rescue'
  gem 'pry-stack_explorer'

end

