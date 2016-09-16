require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  before(:each) do
    @school = FactoryGirl.create(:school)
    @classroom = FactoryGirl.create(:classroom, :school_id=>@school.id)
  end

  context "POST create" do
    it "should be success" do
      post :create, :classroom=>{:name=>@classroom.name, :no_of_student=>@classroom.no_of_student, :school_id=>@classroom.school_id}
      response.status.should eq 201
    end
    it "should not success if invalid params are passed" do
      post :create, :classroom=>{:name=>@classroom.name, :no_of_student=>"ABC", :school_id=>@classroom.school_id}
      response.status.should eq 422
    end
  end
  context "PUT update" do
    it "should success" do
      put :update, id:@classroom.id, :classroom=>{:name=>'5th'}
      response.status.should eq 200
    end
    it "should not success" do
      put :update, id:@classroom.id, :classroom=>{:no_of_student=>"ABC"}
      response.status.should eq 422
    end
  end
end
