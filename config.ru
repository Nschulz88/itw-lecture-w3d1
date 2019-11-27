require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'pry'

APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Load the routes
require APP_ROOT.join('app', 'actions')

set :app_file, __FILE__
run Sinatra::Application
