class Subject < ActiveRecord::Base
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :students

  validates_presence_of :name, :school_ids, :classroom_ids
  validate :validate_classroom_ids
  validate :validate_school_ids

  private

  def validate_classroom_ids
    if classroom_ids.any?{ |id| !id.is_a?(Integer) }
      errors.add(:classroom_ids, 'is not a number')
      return false
    end
  end

  def validate_school_ids
    if school_ids.any?{ |id| !id.is_a?(Integer) }
      errors.add(:school_ids, 'is not a number')
      return false
    end
  end
end