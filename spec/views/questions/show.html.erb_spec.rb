require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = build_stubbed(:question)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include(@question.statement)
    expect(rendered).to include(@question.text)
    expect(rendered).to include(@question.discipline)
  end
end
