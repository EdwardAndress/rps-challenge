require 'spec_helper'
require 'result'

RSpec.describe Result do

  let(:subject) { described_class.new(session) }
  let(:session) do
    { 'player_choice' => human_choice, 'computer_choice' => computer_choice }
  end

  describe '#description' do
    context 'human choses rock' do
      let(:human_choice) { :rock }

      context 'computer choses paper' do
        let(:computer_choice) { :paper }

        it 'declares the computer won' do
          expect(subject.description).to eq 'The computer WON'
        end
      end

      context 'computer choses scissors' do
        let(:computer_choice) { :scissors }

        it 'declares the human won' do
          expect(subject.description).to eq 'You WON'
        end
      end

      context 'computer choses rock' do
        let(:computer_choice) { :rock }

        it 'declares a draw' do
          expect(subject.description).to eq 'Nobody WON'
        end
      end
    end

    context 'human choses paper' do
      let(:human_choice) { :paper }

      context 'computer choses paper' do
        let(:computer_choice) { :paper }

        it 'declares a draw' do
          expect(subject.description).to eq 'Nobody WON'
        end
      end

      context 'computer choses scissors' do
        let(:computer_choice) { :scissors }

        it 'declares the computer won' do
          expect(subject.description).to eq 'The computer WON'
        end
      end

      context 'computer choses rock' do
        let(:computer_choice) { :rock }

        it 'declares the human won' do
          expect(subject.description).to eq 'You WON'
        end
      end
    end

    context 'human choses scissors' do
      let(:human_choice) { :scissors }

      context 'computer choses paper' do
        let(:computer_choice) { :paper }

        it 'declares the humnan won' do
          expect(subject.description).to eq 'You WON'
        end
      end

      context 'computer choses scissors' do
        let(:computer_choice) { :scissors }

        it 'declares a draw' do
          expect(subject.description).to eq 'Nobody WON'
        end
      end

      context 'computer choses rock' do
        let(:computer_choice) { :rock }

        it 'declares the computer won' do
          expect(subject.description).to eq 'The computer WON'
        end
      end
    end
  end
end
