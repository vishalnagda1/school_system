class Classroom < ActiveRecord::Base
  belongs_to :school
  has_many :students
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :subjects

  validates_presence_of :name, :no_of_student
  validates_numericality_of :no_of_student
end
