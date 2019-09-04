class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :time_limit
      t.boolean :status
      t.integer :subject_id
      t.integer :create_by
      t.integer :mark_require
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
