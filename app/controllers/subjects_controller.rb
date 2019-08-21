class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def index
    @subjects = Subject.where(create_by: current_user.id)
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "subject_created"
      redirect_to subjects_path
    else
      flash[:danger] = t "fail_create"
    end
  end

  def edit
    @subject = Subject.find_by(id: params[:id])
    remember_subject(@subject)
    @questions = Question.where(subject_id: params[:id])
    @exams = Exam.where(subject_id: params[:id])
  end

  def update
    @subject = Subject.find_by(id: params[:id])
    @subject.update_attributes(subject_params)
    flash[:success] = t "subject_updated"
    redirect_to edit_subject_path(@subject.id)
  end

  def show
    @trainee = User.trainee.where(id: (UserHasSubject.where(subject_id: params[:id]))).paginate(page: params[:page], per_page: Settings.users_per_page)
  end

  private
  def subject_params
    defaults = {status: true, create_by: current_user.id}
    params.require(:subject).permit(:name, :description).reverse_merge(defaults)
  end

end
