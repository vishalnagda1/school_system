class ChangeDataTypeForAll < ActiveRecord::Migration
  def change
    change_column :schools, :zipcode, :string
    change_column :schools, :phone, :string
    change_column :students, :zipcode, :string
    change_column :students, :phone, :string
    change_column :teachers, :phone, :string
  end
end
