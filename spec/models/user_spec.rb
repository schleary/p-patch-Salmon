require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) {
    User.new(
    email: 'a@b.com',
    name: 'Bookis',
    password: '1234',
    admin: true
    )
  }

  describe 'validations' do
    it 'is valid' do
      expect(user).to be_valid
    end
  end
end
