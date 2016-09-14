class CreateClassroomsSubjects < ActiveRecord::Migration
  def change
    create_table :classrooms_subjects do |t|
      t.integer :classroom_id
      t.integer :subject_id
    end
  end
end
