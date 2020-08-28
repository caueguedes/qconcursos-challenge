require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { build(:question) }

  context 'with valid attributes' do
    it 'creates the question' do
      expect(question).to be_valid
    end
  end

  context 'without valid attributes' do
    context 'when the question lacks a statement' do
      it 'rejects the question as invalid' do
        create(:question_with_question_accesses)
        expect(build(:question, statement:nil)).to_not be_valid
      end
    end

    context 'when the question lacks a text' do
      it 'rejects the question as invalid' do
        expect(build(:question, text:nil)).to_not be_valid
      end
    end

    context 'when the question lacks a answer' do
      it 'rejects the question as invalid' do
        expect(build(:question, answer:nil)).to_not be_valid
      end
    end

    context 'when the question have a not allowed answer' do
      it 'rejects the question as invalid' do
        expect(build(:question, answer: 1)).to_not be_valid
      end
    end

    context 'when the question lacks a discipline' do
      it 'rejects the question as invalid' do
        expect(build(:question, discipline:nil)).to_not be_valid
      end
    end
  end
end
