class Exam < ApplicationRecord
  has_many :trainee_answer_sheets, dependent: :destroy
  has_many :questions_in, class_name: ExamHasQuestion.name, 
                            foreign_key: :exam_id, dependent: :destroy
  has_many :added_questions, through: :questions_in, source: :question
  belongs_to :user, foreign_key: :create_by
  belongs_to :subject, foreign_key: :subject_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :mark_require, presence: true, format: { with: /\A\d+\z/ }
  validates :time_limit, presence: true, format: { with: /\A\d+\z/ }

  def add_question(question, mark)
    added_questions << question
    @added_question = ExamHasQuestion.find_by(question_id: question.id)
    @added_question.mark = mark
    @added_question.save!
  end

  def drop_question(question)
    added_questions.delete(question)
  end

  def question_is_in?(question)
    added_questions.include?(question)
  end
end
