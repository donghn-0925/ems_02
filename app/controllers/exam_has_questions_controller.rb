class ExamHasQuestionsController < ApplicationController
  def create
    @question = Question.find_by(id: params[:question_id])
    @exam = Exam.find_by(id: params[:exam_id])
    
    @exam.add_question(@question, params[:mark])
    respond_to do |format|
      format.html {redirect_to edit_exam_path(@exam.id)}
      format.js
    end
  end

  def update
    @question = Question.find_by(id: params[:question_id])
    @exam = Exam.find_by(id: params[:exam_id])
    @exam.drop_question(@question)
    respond_to do |format|
      format.html {redirect_to edit_exam_path(@exam.id)}
      format.js
    end
  end
end
