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
		# JSON.load("test")
		repos = Octokit.repositories(@user)
		# # binding.pry

	  language_obj = count_repo_languages(repos)

	  languages = compile_languages_hash(language_obj)

    @languages = languages.to_json
    # raise languages.inspect
    haml :index
  end

  def count_repo_languages(repos)
  	language_obj = {}
  	repos.each do |repo|
    	# sometimes language can be nil 
	    if repo['language'] != nil
	      if !language_obj[repo['language']]
	        language_obj[repo['language']] = 1
	      else
	        language_obj[repo['language']] += 1
	      end
	    end
	  end
	  language_obj
	end

	def compile_languages_hash(language_obj)
		languages = []
    language_obj.each do |lang, count|
      languages.push :language => lang, :count => count
    end
    languages
	end

end	