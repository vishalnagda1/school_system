class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :phone

      t.timestamps null: false
    end
  end
end
