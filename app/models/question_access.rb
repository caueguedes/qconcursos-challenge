class QuestionAccess < ApplicationRecord
  belongs_to :question

  include QuestionAccessValidator
end
