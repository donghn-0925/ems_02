class UserHasSubjectsController < ApplicationController
  def index
    @trainees = User.trainee.paginate(page: params[:page], per_page: Settings.users_per_page)
    # @trainees = User.trainee.where(id: (UserHasSubject.where(subject_id: params[:id]))).paginate(page: params[:page], per_page: Settings.users_per_page)
  end

  def create
    @user = User.find_by(id: params[:user_id])
    current_subject_object.user_in_subject(@user)
    respond_to do |format|
      format.html {redirect_to user_has_subjects_path}
      format.js
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    current_subject_object.user_out_subject(@user)
    respond_to do |format|
      format.html {redirect_to user_has_subjects_path}
      format.js
    end
  end
end
