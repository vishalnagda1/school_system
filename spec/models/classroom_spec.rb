require 'rails_helper'

RSpec.describe Classroom, type: :model do
  context 'validation' do
    ["name", "no_of_student", "school_id"].each do |field|
      it "should be invalid if #{field} is not present" do
        FactoryGirl.build(:classroom, "#{field}".to_sym => nil).should_not be_valid
      end
    end

    it { should validate_numericality_of(:no_of_student) }
    it { should validate_numericality_of(:school_id) }
  end
end
