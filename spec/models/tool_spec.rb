require 'rails_helper'

RSpec.describe Tool, :type => :model do

  let(:tool) {
    Tool.new(
    name: 'shovel',
    img: 'www.shovel.com'
    )
  }

  describe 'validations' do
    it 'is valid' do
      expect(tool).to be_valid
    end
  end

  describe 'checkout' do
    it 'changes availability to false' do
      tool.checkout(1)
      expect(tool.availability).to eq(false)
    end

    it 'changes person_id to the id of the check-outer' do
      tool.checkout(1)
      expect(tool.person_id).to be(1)
    end

  end

  describe 'put_back' do
    it 'changes availability to true' do
      tool.checkout(1)
      tool.put_back
      expect(tool.availability).to eq(true)
    end

    it 'changes person_id to nil' do
      tool.checkout(1)
      tool.put_back
      expect(tool.person_id).to eq(nil)
    end
  end
end
