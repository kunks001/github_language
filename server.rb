require 'sinatra'
require 'haml'
require 'net/http'
require 'json'
require 'octokit'

module GitLanguageHelpers
  def get_json(uri)
    response = Net::HTTP.get_response(URI(uri))
    JSON.parse(response.body)
  end

  def get_favourite_language(user)
    uri = "https://api.github.com/users/#{user}/repos"
    repos = get_json(uri)
    repos.map {|repo| repo['language'] }.get_mode.first
  end
end

class Hash
  def ninvert
    inject({}) { |h,(k,v)| (h[v] ||= []) << k; h }
  end
end

class Array
  def get_mode
    (inject(Hash.new(0)) { |h,e| h[e] += 1; h }.ninvert.max || 
    [[]]).last
  end
end

class GithubLanguage < Sinatra::Base
  require_relative 'controllers/github_language'
end