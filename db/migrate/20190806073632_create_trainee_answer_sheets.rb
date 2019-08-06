class CreateTraineeAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_answer_sheets do |t|
      t.datetime :Starttime
      t.datetime :FinishTime
      t.boolean :status
      t.integer :TotalMark
      t.text :AnswerSheet
      t.integer :Exam_id
      t.integer :Trainee_id
      t.boolean :is_passed

      t.timestamps
    end
  end
end
