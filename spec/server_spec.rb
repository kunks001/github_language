require_relative './spec_helper'

def response(file_name)
  File.open(File.dirname(__FILE__) + '/support/fixtures/' + file_name, 'rb').read
end

describe GithubLanguage do

	context 'after submitting a username' do

		it 'returns a JSON object containing a language count' do
			Net::HTTP.stub(get_response: double(:response, body: response('user_repos.json')))
			post '/'
			expect(last_response).to be_ok
	    expect(last_response.body).to include 'Ruby'
	  end

	end

end