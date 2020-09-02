module QuestionAccessValidator
  extend ActiveSupport::Concern

  included do
    validates :date,              presence: true
    validates :times_accessed,    presence: true
    validates :times_accessed,       numericality: { greater_than_or_equal_to: 0}
  end
end
