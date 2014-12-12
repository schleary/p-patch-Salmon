require 'rails_helper'

RSpec.describe Post, :type => :model do

  let(:post) {
    Post.new(
    content: 'Blah',
    title: 'Blah Squared',
    img: "https://placekitten.com/g/200/300",
    author: "Holly"
    )
  }

  describe 'validations' do
    it 'is valid' do
      expect(post).to be_valid
    end
  end
end
