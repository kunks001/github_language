require 'sinatra'
require 'haml'
require 'net/http'
require 'json'
require 'octokit'

class GithubLanguage < Sinatra::Base

  require_relative './controllers/github_language'
  require_relative './helpers/github_language'
  require_relative './helpers/application'

  include GitLanguageHelper
  include ApplicationHelper
end