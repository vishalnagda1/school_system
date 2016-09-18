class Teacher < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :students
  has_and_belongs_to_many :subjects

  validates_presence_of :name, :gender, :phone, :school_id, :classroom_ids, :subject_ids
  validates_numericality_of :phone, :school_id
  validates_length_of :phone, :minimum => 10, :maximum => 10
  validates_inclusion_of :gender, in: ['male', 'female', 'other']

  # def subject_details
  #   self.subjects
  # end
end
