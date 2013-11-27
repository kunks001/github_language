require_relative './spec_helper'

# module TestModule
# 	def self.putsit
# 		raise "calling some server"
# 	end
# end

def json_response(file_name)
  JSON.parse(File.open(File.dirname(__FILE__) + '/support/fixtures/' + file_name, 'rb').read)
end

describe GithubLanguage do

	# it 'sjdlfk' do
	# 	TestModule.stub(:putsit)
	# 	expect{TestModule.putsit}.not_to raise_error
	# 	raise TestModule.putsit.inpsect
	# end

	it 'sjdlfk' do
		Octokit.stub(:repositories=>json_response('user_repos.json') )
		post '/'
		last_response.should.be.ok
    expect(JSON.parse(last_response.body)).to include 'Hello World'
		# expect().to eq 'ruby'
	end

end