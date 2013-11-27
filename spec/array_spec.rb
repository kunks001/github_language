require_relative './spec_helper'
require_relative '../helpers/application'

describe Array do
	let(:array){ ["one","one","two","one"] }

	it 'should be able to return the mode of the array' do
		expect(array.get_mode).to eq "one"
	end
end