require 'sinatra'
require 'haml'
require 'octokit'
# require 'pry-debugger'

class GithubLanguage < Sinatra::Base

	get '/' do
		haml :index
	end

	post '/' do
		@user = params[:user]
		repos = Octokit.repositories(@user)
		# binding.pry
		language_obj = {}

		repos.each do |repo|
    	# sometimes language can be nil 
	    if repo.language != nil
	      if !language_obj[repo.language]
	        language_obj[repo.language] = 1
	      else
	        language_obj[repo.language] += 1
	      end
	    end
	  end

    languages = []
    language_obj.each do |lang, count|
      languages.push :language => lang, :count => count
    end

    @languages = languages.to_json
    # raise languages.inspect
    haml :index
  end

end

