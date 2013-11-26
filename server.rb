require 'sinatra'
require 'haml'

class GithubLanguage < Sinatra::Base

	get '/' do
		haml :index
	end
end