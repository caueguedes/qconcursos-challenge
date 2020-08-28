class Question < ApplicationRecord
  has_many :question_accesses

  include QuestionValidator
end
