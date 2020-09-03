require 'rails_helper'

RSpec.describe QueryQuestions::HotTopics do
  it 'to generate query' do
    expect(QueryQuestions::HotTopics.call.to_sql).to match(/SELECT "questions"."discipline", SUM\(daily_access \+ coalesce\(times_accessed, 0\)\) as total_accesses FROM "questions" LEFT JOIN \(SELECT "question_accesses".\* FROM "question_accesses" WHERE "question_accesses"."date" BETWEEN '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}' AND '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d+'\) as accesses on questions.id = accesses.question_id GROUP BY "questions"."discipline" ORDER BY "total_accesses" DESC/)
  end
end