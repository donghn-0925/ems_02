class QuestionsController < ApplicationController
  before_action :load_question_by_id, only: [:edit, :update]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_with_default_params
    if @question.save
      flash[:success] = t "question_created"
    else
      flash[:danger] = t "fail_create"
    end
    redirect_to edit_subject_path(@question.subject_id)
  end

  def edit; end

  def update
    @question.update_attributes(question_params)
    flash[:success] = t "question_updated"
    redirect_to edit_subject_path(@question.subject_id)
  end

  private
  def question_params
    params.require(:question).permit(:question_content, :correct_answers, :question_type)
  end

  def question_with_default_params
    @answers = []
    @answers << params[:answer1] << params[:answer2] << params[:answer3] << params[:answer4]
    @answers.to_json.to_s
    defaults = {status: true, create_by: current_user.id, subject_id: current_subject, answers: @answers}
    question_params.reverse_merge(defaults)
  end

  def load_question_by_id
    @question = Question.find_by(id: params[:id])
  end
end
