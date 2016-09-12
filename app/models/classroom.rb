class Classroom < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :students

  validates_presence_of :name, :no_of_student
  validates_numericality_of :no_of_student
end
