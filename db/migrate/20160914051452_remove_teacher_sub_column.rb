class RemoveTeacherSubColumn < ActiveRecord::Migration
  def change
    remove_column :teachers, :subject
  end
end
