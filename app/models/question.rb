class Question < ApplicationRecord
  has_many :question_accesses

  scope :filter_by_discipline, -> (discipline) { where(discipline: discipline) }

  include QuestionValidator
  include Filterable
end
