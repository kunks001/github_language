module GitLanguageHelper
  def get_json(uri)
    response = Net::HTTP.get_response(URI(uri))
    JSON.parse(response.body)
  end

  def get_favourite_language(user)
    uri = "https://api.github.com/users/#{user}/repos"
    repos = get_json(uri)

    if !repos.is_a?(Array)
      "Sorry, that user doesn't exist. Please try again"
    else
      get_mode_of(repos)
    end
  end

  def get_mode_of(repos)
    favourite_language = repos.map {|repo| repo['language'] }.get_mode
    favourite_language == nil ? "Oops, that user doesn't seem to have a favourite language!" : favourite_language
  end
end
