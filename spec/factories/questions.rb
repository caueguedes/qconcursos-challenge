FactoryBot.define do
  factory :question do
    statement { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    answer { ('A'..'E').to_a.shuffle.first }
    daily_access { rand(1...300) }
    discipline { Faker::Educator.subject }

    factory :question_with_question_accesses do
      after(:create) do |question_instance|
        Array.new(40) { | days | create(:question_access, date: days.day.ago, question: question_instance)}
      end
    end
  end
end
