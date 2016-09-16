class Subject < ActiveRecord::Base
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :students

  validates_presence_of :name, :school_ids, :classroom_ids
  # validates_numericality_of :school_ids, :classroom_ids
end
