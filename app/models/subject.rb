class Subject < ApplicationRecord
  #belongs_to :user, foreign_key: :create_by
  has_many :users, through: :user_has_subject
  has_many :user_has_subjects#, foreign_key: :subject_id#, dependent: destroy
  has_many :exams#, dependent: destroy
  has_many :questions#, dependent: destroy
end
