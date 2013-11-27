require_relative '../helpers/github_language'

class GithubLanguage < Sinatra::Base
  include GitLanguageHelpers

  get '/' do
    haml :index
  end

  post '/*' do
    user = params[:username]
    @languages = get_favourite_language(user)
    haml :index
  end

end	