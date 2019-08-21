class TraineeAnswerSheetsController < ApplicationController
  
  def index
    @answer_sheets = TraineeAnswerSheet.where(trainee_id: current_user)
  end

  def create
    @answer_sheet = TraineeAnswerSheet.new answer_sheet_params
    if @answer_sheet.save
      flash[:success] = t "created"
    else
      flash[:danger] = t "failed"
    end
    redirect_to trainee_index_path
  end

  def edit
    @answer_sheet = TraineeAnswerSheet.find_by(id: params[:id])
  end

  private
  def answer_sheet_params
    defaults = {status: true, trainee_id: current_user.id, finish_time: DateTime.now  }
    params.require(:trainee_answer_sheet).permit(:start_time, :exam_id).reverse_merge(defaults)
  end
end
