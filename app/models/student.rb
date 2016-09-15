class Student < ActiveRecord::Base
  belongs_to :school
  belongs_to :classroom
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :subjects

  validates_presence_of :name, :father_name, :mother_name, :city, :state, :zipcode, :phone
  validates_numericality_of :zipcode, :phone
  validates_length_of :phone, :minimum => 10, :maximum => 10
end
