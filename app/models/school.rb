class School < ActiveRecord::Base
  has_many :students
  has_many :teachers
  has_many :classrooms

  validates_presence_of :name, :city, :state, :zipcode, :phone
  validates_numericality_of :zipcode, :phone
  validates_length_of :phone, :minimum => 10, :maximum => 10
end