require 'spec_helper'
require 'result'

RSpec.describe Result do

	subject { described_class.new(session) }

	let(:session) do
		{ 
			'player_one_choice' => player_one_choice,
			'player_two_choice' => player_two_choice,
			'player_one'				=> 'eddie',
			'player_two'				=> 'andreia'
		}
	end

	context 'when the result is a draw' do
		let(:player_one_choice) { :rock }
		let(:player_two_choice) { :rock }

		describe '#draw?' do
			it 'returns true' do
				expect(subject.draw?).to eq true
			end
		end
	end

	context 'when there is a winner' do
		let(:player_one_choice) { :rock }
		let(:player_two_choice) { :paper }

		describe '#draw?' do
			it 'returns true' do
				expect(subject.draw?).to eq false
			end
		end

		describe '#winner' do
			it 'returns the name of the winner' do
				expect(subject.winner).to eq 'andreia'
			end
		end

		describe '#winning_weapon' do
			it 'returns the winning weapon' do
				expect(subject.winning_weapon).to eq :paper
			end
		end

		describe '#loser' do
			it 'returns the name of the loser' do
				expect(subject.loser).to eq 'eddie'
			end
		end

		describe '#losing_weapon' do
			it 'returns the losing weapon' do
				expect(subject.losing_weapon).to eq :rock
			end
		end
	end
end
