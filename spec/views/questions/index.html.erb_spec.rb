require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:all) do
    create_list(:question, 2)
    @questions = Question.all.page(1)
  end

  context 'should render table' do
    it "renders the first question" do
      render
      expect(rendered).to include Question.first.text
      expect(rendered).to include Question.first.statement
      expect(rendered).to include Question.first.discipline
    end

    it "renders the second question" do
      render
      expect(rendered).to include Question.second.text
      expect(rendered).to include Question.second.statement
      expect(rendered).to include Question.second.discipline
    end
  end


  context 'render filter links'
  it 'render a list of filter links' do
    @hot_topics = QueryQuestions::HotTopics.call

    render
    expect(rendered).to include(questions_path(discipline: Question.first.discipline))
    expect(rendered).to include(questions_path(discipline: Question.second.discipline))
  end
end
