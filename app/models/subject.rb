class Subject < ApplicationRecord
  #belongs_to :user, foreign_key: :create_by

  has_many :active_trainees, class_name: UserHasSubject.name, 
                             foreign_key: :subject_id, dependent: :destroy
  has_many :users_in, through: :active_trainees, source: :user

  has_many :exams#, dependent: destroy
  has_many :questions, foreign_key: :subject_id, dependent: :destroy

  scope :active_subjects,-> (current_user_id){where id: (UserHasSubject.select(:subject_id).where(user_id: current_user_id))}

  def user_in_subject(user)
    users_in << user
  end

  def user_out_subject(user)
    users_in.delete(user)
  end

  def user_in?(user)
    users_in.include?(user)
  end
end
