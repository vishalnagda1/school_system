class AddSchoolIdInClasNdStu < ActiveRecord::Migration
  def change
    add_column :classrooms, :school_id, :integer
    add_column :students, :school_id, :integer
  end
end
