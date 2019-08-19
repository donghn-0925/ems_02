class Question < ApplicationRecord
  # belongs_to :user
  belongs_to :subject
  has_many :exam_has_questions, dependent: :destroy
end
