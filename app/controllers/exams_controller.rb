class ExamsController < ApplicationController
  before_action :load_exam_by_id, only: [:edit, :update]

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new exam_with_default_params
    if @exam.save
      flash[:success] = t "exam_created"
    else
      flash[:danger] = t "fail_create"
    end
    redirect_to edit_subject_path(@exam.subject_id)
  end

  def edit; end

  def update
    @exam.update_attributes(exam_params)
    flash[:success] = t "exam_updated"
    redirect_to edit_subject_path(@exam.subject_id)
  end
  
  private
  def exam_params
    params.require(:exam).permit(:name, :time_limit, :mark_require)
  end
  
  def exam_with_default_params
    defaults = {status: true, create_by: current_user.id, subject_id: current_subject}
    exam_params.reverse_merge(defaults)
  end

  def load_exam_by_id
    @exam = Exam.find_by(id: params[:id])
    return if @exam
    flash[:danger] = t "exam_not_found"
    redirect_to edit_subject_path(current_subject)
  end
end
