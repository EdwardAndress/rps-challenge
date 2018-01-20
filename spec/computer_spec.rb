require 'spec_helper'
require 'computer'

RSpec.describe Computer do
  describe '#choice' do
    it 'can return :paper' do
      srand(1)
      expect(subject.choice).to eq :paper
    end

    it 'can return :rock' do
      srand(2)
      expect(subject.choice).to eq :rock
    end

    it 'can return :scissors' do
      srand(3)
      expect(subject.choice).to eq :scissors
    end
  end
end
