class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "question_created"
    else
      flash[:danger] = t "fail_create"
    end
    redirect_to edit_subject_path(@question.subject_id)
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])
    @question.update_attributes(question_params)
    flash[:success] = t "question_updated"
    redirect_to edit_subject_path(@question.subject_id)
  end

  private
  def question_params
    @answers = params[:answers]
    @correct_answers = params[:correct_answers]
    defaults = {status: true, create_by: current_user.id, subject_id: current_subject, answers: @answers, correct_answers: @correct_answers, question_type: @all_correct_answers}
    params.require(:question).permit(:question_content).reverse_merge(defaults)
  end
end
