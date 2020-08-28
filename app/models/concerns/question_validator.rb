module QuestionValidator
  extend ActiveSupport::Concern

  included do
    validate  :answers_permitted
    validates :answer,            presence: true
    validates :daily_access,      presence: true
    validates :discipline,        presence: true
    validates :statement,         presence: true
    validates :text,              presence: true
  end

  def answers_permitted
    errors.add(:answer, 'answer not in the permitted range. Range allowed from "A" to "E"') unless ("A".."E").include?(answer)
  end
end
