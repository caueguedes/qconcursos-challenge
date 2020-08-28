require 'rails_helper'

RSpec.describe QuestionAccess, type: :model do
  context 'with a question' do
    let(:question_access) { build(:question_access, :with_question ) }

    it 'creates a question access record' do
      expect(question_access).to be_valid
    end
  end

  context 'without a question' do
    let(:question_access) { build(:question_access) }
    it 'rejects the question access record' do
      expect(question_access).not_to be_valid
    end
  end
end
