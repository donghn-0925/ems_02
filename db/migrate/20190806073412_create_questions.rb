class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :QuestionTxt
      t.text :AnswerTxt
      t.text :CorrectAnswer
      t.boolean :status
      t.integer :subject_id
      t.integer :create_by
      t.string :type

      t.timestamps
    end
  end
end
