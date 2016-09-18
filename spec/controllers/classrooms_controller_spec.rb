require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  before(:each) do
    @school = FactoryGirl.create(:school)
  end
  context "GET index" do
    it "should assigns @classrooms" do
      classroom = FactoryGirl.create(:classroom, :school_id=>@school.id)
      get :index
      expect(assigns(:classrooms)).to eq([classroom])
    end
    it "should renders the index template" do
      get :index
      # expect(response).to render_template("index")
      response.should render_template :index
    end
  end
  context "GET new" do
    it "should assign a new classroom to @classroom" do
      get :new
      expect(assigns(:classroom)).to be_a_new(Classroom)
      response.status.should eq 200
    end
  end
  context "POST create" do
    before(:each) do
      @classroom = FactoryGirl.build(:classroom, :school_id=>@school.id)
    end
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
    before(:each) do
      @classroom = FactoryGirl.create(:classroom, :school_id=>@school.id)
    end
    it "should success" do
      put :update, id:@classroom.id, :classroom=>{:name=>'5th'}
      response.status.should eq 200
    end
    it "should not success" do
      put :update, id:@classroom.id, :classroom=>{:no_of_student=>"ABC"}
      response.status.should eq 422
    end
  end
  context "DELETE destroy" do
    before(:each) do
      @classroom = FactoryGirl.create(:classroom, :school_id=>@school.id)
    end

    it "should delete the school" do
      expect{
        delete :destroy, id: @classroom
      }.to change(Classroom,:count).by(-1)
    end

    it "should redirect to classroom#index" do
      delete :destroy, id: @classroom
      response.should redirect_to classrooms_url
    end
  end
end
