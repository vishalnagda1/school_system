require 'rails_helper'

RSpec.describe Subject, type: :model do
  context 'validation' do
    ["name"].each do |field|
      it "should be invalid if #{field} is not present" do
        FactoryGirl.build(:school, "#{field}".to_sym => nil).should_not be_valid
      end
    end
    # it "should validate the method" do
    #   @school1 = FactoryGirl.create(:school)
    #   @classroom1 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    #   @classroom2 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    #   @subject = FactoryGirl.build(:subject)
    #   @subject.classrooms<<@classroom1
    #   @subject.classrooms<<@classroom2
    #   @subject.schools<<@school1
    #   attributes=@subject.attributes.merge(:classroom_ids=>@subject.classroom_ids,:school_ids=>@subject.school_ids)
    #
    # end
  end
end
