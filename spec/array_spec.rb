require_relative './spec_helper'
require_relative '../helpers/application'

describe Array do
  let(:array){ ["one","one","two","one"] }
  let(:multiple_mode_array){ ["one","one","two","one","two","two","three"] }

  it 'should be able to return the mode of the array' do
    expect(array.get_mode).to eq "one"
  end

end