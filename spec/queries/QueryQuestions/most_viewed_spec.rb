require 'rails_helper'

RSpec.describe QueryQuestions::MostViewed do
  subject { described_class.new.by_week }

  it 'generates the follow sql' do
    expect(subject.to_sql).to match(/SELECT questions.\* ,\(coalesce\(sum_times_accessed, 0\) \+ daily_access\) as total_accesses FROM "questions" LEFT JOIN \(SELECT "question_accesses"."question_id", SUM\(coalesce\(times_accessed, 0\)\)  sum_times_accessed FROM "question_accesses" WHERE "question_accesses"."date" BETWEEN '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d+' AND '\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d+' GROUP BY "question_accesses"."question_id"\) summed_accesses on summed_accesses.question_id = questions.id ORDER BY "total_accesses" DESC/)
  end
end