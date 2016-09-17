require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  context "GET index" do
    it "should assigns @schools" do
      school = FactoryGirl.create(:school)
      get :index
      expect(assigns(:schools)).to eq([school])
    end
    it "should renders the index template" do
      get :index
      # expect(response).to render_template("index")
      response.should render_template :index
    end
  end
  context "GET new" do
    it "should assign a new school to @school" do
      get :new
      expect(assigns(:school)).to be_a_new(School)
      response.status.should eq 200
    end
  end
  # context "GET show" do
  #   it "should assigns the requested school to @school" do
  #     school = FactoryGirl.create(:school)
  #     assigns(:school).should eq(school)
  #   end
  # end
  context "POST create" do
    before(:each) do
      @school = FactoryGirl.build(:school)
    end
    it "should return success if valid params are passed" do
      post :create, :school=>{:name=>@school.name, :city=>@school.city, :state=>@school.state, :zipcode=>@school.zipcode, :phone=>@school.phone}
      response.status.should eq 201
    end
    it "should not return success if invalid params are passed" do
      post :create, :school=>{:name=>@school.name, :city=>@school.city, :state=>@school.state, :zipcode=>'ABCD', :phone=>'123456789'}
      response.status.should eq 422
    end
  end
  context "PUT update" do
    before(:each) do
      @school = FactoryGirl.create(:school)
    end
    it "should return success if valid params are passed" do
      put :update, :id=>@school.id, :school=>{:phone=>"8769032876"}
      response.status.should eq 200
    end
    it "should not return success if invalid params are passed" do
      put :update, :id=>@school.id, :school=>{:phone=>"abcdefghij"}
      response.status.should eq 422
    end
  end
  context "DELETE destroy" do
    before(:each) do
      @school = FactoryGirl.create(:school)
    end

    it "should delete the school" do
      expect{
        delete :destroy, id: @school
      }.to change(School,:count).by(-1)
    end

    it "should redirect to index" do
      delete :destroy, id: @school
      response.should redirect_to schools_url
    end
    # it "should destroy school and return 302" do
    #   school = FactoryGirl.create(:school)
    #   delete :destroy, :id=>school.id
    #   response.status.should eq 302
    # end
  end
end