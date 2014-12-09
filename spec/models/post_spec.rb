require 'rails_helper'

RSpec.describe Post, :type => :model do

  let(:post) {
    post.new(
    content: 'Blah',
    title: 'Blah Squared',
    user_id: 1,
    )
  }

  describe 'validations' do
    it 'is valid' do
      expect(post).to be_valid
    end
  end
end
