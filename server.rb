require 'sinatra'
require 'haml'
require 'net/http'
require 'json'

class GithubLanguage < Sinatra::Base

  require_relative './controllers/github_language'
  require_relative './helpers/github_language'
  require_relative './helpers/application'

  include GitLanguageHelper
end