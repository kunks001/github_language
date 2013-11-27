class GithubLanguage < Sinatra::Base

  get '/' do
    haml :index
  end

  post '/*' do
    user = params[:username]
    @languages = get_favourite_language(user)
    haml :index
  end

end	