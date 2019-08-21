class TraineeController < ApplicationController
  def index
    @subjects = current_user.subjects
    @exams = Exam.where(subject_id: @subjects.ids)
  end

  def active_subjects
    @subject = current_user.active_subjects
  end
end
