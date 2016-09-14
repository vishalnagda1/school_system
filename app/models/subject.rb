class Subject < ActiveRecord::Base
  has_and_belongs_to_many :school
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :students

  validates_presence_of :name
end
