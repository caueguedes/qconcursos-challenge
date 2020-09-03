require "rails_helper"

RSpec.describe QuestionsController, type: :routing do
  describe "routing" do
    it "routes to #question" do
      expect(:get => "/questions").to route_to("questions#index")
    end

    it "routes to #show" do
      expect(:get => "/questions/1").to route_to("questions#show", :id => '1')
    end
  end
end
