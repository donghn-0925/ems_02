class ExamsController < ApplicationController
  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save
      flash[:success] = t "exam_created"
    else
      flash[:danger] = t "fail_create"
    end
    redirect_to edit_subject_path(@exam.subject_id)
  end

  def edit
    @exam = Exam.find_by(id: params[:id])
  end

  def update
    @exam = Exam.find_by(id: params[:id])
    @exam.update_attributes(exam_params)
    flash[:success] = t "exam_updated"
    redirect_to edit_subject_path(@exam.subject_id)
  end
  
  private
  def exam_params
    defaults = {status: true, create_by: current_user.id, subject_id: current_subject}
    params.require(:exam).permit(:name, :time_limit, :mark_require).reverse_merge(defaults)
  end
end
