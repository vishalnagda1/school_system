require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  before(:each) do
    @school1 = FactoryGirl.create(:school)
    @classroom1 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @classroom2 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @subject1 = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id, @classroom2.id])
    @subject2 = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id])
  end
  context "GET index" do
    before(:each) do
      @teacher = FactoryGirl.create(:teacher, :school_id=>@school1.id, :classroom_ids=>[@classroom1.id, @classroom2.id], :subject_ids=>[@subject1.id,@subject2.id])
    end
    it "should assign @teachers" do
      get :index
      expect(assigns(:teachers)).to eq([@teacher])
    end
    it "should renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  context "GET new" do
    it "should assign a new teacher to @teacher" do
      get :new
      expect(assigns(:teacher)).to be_a_new(Teacher)
      response.status.should eq 200
    end
  end
  context "POST Create" do
    before(:each) do
      @teacher = FactoryGirl.build(:teacher, :school_id=>@school1.id)
      @teacher.classrooms<<@classroom1
      @teacher.classrooms<<@classroom2
      @teacher.subjects<<@subject1
      @teacher.subjects<<@subject2
    end
    it "should be success" do
      attributes=@teacher.attributes.merge(:classroom_ids=>@teacher.classroom_ids,:subject_ids=>@teacher.subject_ids)
      post :create, :teacher=>attributes
      response.status.should eq 201
    end
    it "should not be success" do
      attributes=@teacher.attributes.merge(:classroom_ids=>@teacher.classroom_ids,:subject_ids=>@teacher.subject_ids)
      attributes["phone"]="ABCD"
      post :create, :teacher=>attributes
      response.status.should eq 422
    end
  end
  context "PUT update" do
    before(:each) do
      @teacher = FactoryGirl.create(:teacher, :school_id=>@school1.id, :classroom_ids=>[@classroom1.id, @classroom2.id], :subject_ids=>[@subject1.id,@subject2.id])
    end
    it "should update the teacher name return status 200" do
      put :update, id:@teacher.id, :teacher=>{:name=>'Guru'}
      response.status.should eq 200
    end
    it "should return status code 422, if passing invalid param" do
      put :update, id:@teacher.id, :teacher=>{:phone=>"ABCD"}
      response.status.should eq 422
    end
  end
   context "DELETE  destroy" do
     before(:each) do
       @teacher = FactoryGirl.create(:teacher, :school_id=>@school1.id, :classroom_ids=>[@classroom1.id, @classroom2.id], :subject_ids=>[@subject1.id,@subject2.id])
     end
     it "should delete the teacher" do
       expect{
         delete :destroy, id: @teacher
       }.to change(Teacher,:count).by(-1)
     end

     it "should redirect to teacher#index" do
       delete :destroy, id: @teacher
       response.should redirect_to teachers_url
     end
   end
end
