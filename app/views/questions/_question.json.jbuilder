json.extract! question, :id, :statement, :text, :answer, :daily_access, :discipline, :created_at, :updated_at
json.url question_url(question, format: :json)
