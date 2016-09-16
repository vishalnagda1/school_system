require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  before(:each) do
    @school1 = FactoryGirl.create(:school)
    @classroom1 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @classroom2 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @subject = FactoryGirl.build(:subject)
    @subject.classrooms<<@classroom1
    @subject.classrooms<<@classroom2
    @subject.schools<<@school1
  end
  context "POST create" do
    it "should be success" do
      # p @subject
      # p @subject.classrooms
      # p @subject.classroom_ids
      attributes=@subject.attributes.merge(:classroom_ids=>@subject.classroom_ids,:school_ids=>@subject.school_ids)
      post :create, :subject=>attributes

      response.status.should eq 201
    end
  end
end
