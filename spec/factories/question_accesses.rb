FactoryBot.define do
  factory :question_access do
    date {  1.day.ago }
    times_accessed { rand(2000...5000) }

    trait :with_question do
      association :question, factory: :question
    end
  end
end
