require 'sinatra'
require 'haml'
require 'net/http'
require 'json'
require 'octokit'

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
  require_relative './controllers/github_language'
end