require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when not valid' do
	  it { is_expected.to be_invalid }
	end
end
