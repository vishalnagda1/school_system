class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :gender
      t.integer :phone
      t.string :subject

      t.timestamps null: false
    end
  end
end
