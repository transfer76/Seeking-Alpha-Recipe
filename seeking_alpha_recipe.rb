# frozen_string_literal: true

require 'dotenv/load'

# Class SeekingAlphaRecipe provide entry level app
class SeekingAlphaRecipe < Sinatra::Application
  use Rack::Session::EncryptedCookie, secret: ENV.fetch('SECRET', nil)

  set :app_file, __FILE__
  set :server, :puma
  set :views, proc { File.join(root, 'app/views') }
  set :assets, Sprockets::Environment.new
  set :assets_manifest, %w[app.js app.css]
  use Rack::Csrf, raise: true

  configure do
    assets.append_path 'assets/stylesheets'
    assets.append_path 'assets/javascripts'
  end

  configure :development do
    get '/assets/*' do
      env['PATH_INFO'].sub!('/assets', '')
      settings.assets.call(env)
    end
  end

  configure :production do
    # Serve assets via Nginx or Apache
    disable :static

    assets.js_compressor  = :uglify
    assets.css_compressor = :sass
  end
end
