require 'sinatra'

class GithubLanguage < Sinatra::Base

	get '/' do
		"hello world"
	end
end