class User < ApplicationRecord
  # has_and_belongs_to_many :subjects#, through: :user_has_subject #, dependent: destroy
  # has_many :subjects, through: :user_has_subject
  has_many :active_subjects, class_name: UserHasSubject.name,
                             foreign_key: :user_id, 
                             dependent: :destroy
  has_many :subjects, through: :active_subjects, source: :subject

  has_many :exams#, dependent: destroy
  has_many :trainee_answer_sheets#, dependent: destroy
  # has_many :questions, class_name: Question.name, foreign_key: :create_by
  # has_many :users
  # belongs_to :user, foreign_key: :create_by
  enum role: [:trainee, :admin, :supervisor] 

  before_save { email.downcase! }
  validates :email, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
