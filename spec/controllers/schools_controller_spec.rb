require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  before(:each) do
    @school = FactoryGirl.create(:school)
  end
  context "POST create" do
    it "should return success if valid params are passed" do
      post :create, :school=>{:name=>@school.name, :city=>@school.city, :state=>@school.state, :zipcode=>@school.zipcode, :phone=>@school.phone}
      response.status.should eq 200
    end
    it "should not return success if invalid params are passed" do
      post :create, :school=>{:name=>@school.name, :city=>@school.city, :state=>@school.state, :zipcode=>'ABCD', :phone=>'123456789'}
      response.status.should eq 422
    end
  end
  context "PUT update" do
    it "should return success if valid params are passed" do
      put :update, :id=>@school.id, :school=>{:phone=>"8769032876"}
      response.status.should eq 200
    end
    it "should not return success if invalid params are passed" do
      put :update, :id=>@school.id, :school=>{:phone=>"abcdefghij"}
      response.status.should eq 422
    end
  end
end