module GitLanguageHelper
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
