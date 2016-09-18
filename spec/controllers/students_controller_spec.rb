require 'rails_helper'
#http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
RSpec.describe StudentsController, type: :controller do
  before(:each) do
    @school1 = FactoryGirl.create(:school)
    @classroom1 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @classroom2 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @subject1 = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id, @classroom2.id])
    @subject2 = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id])
    @teacher1 = FactoryGirl.create(:teacher, :school_id=>@school1.id, :classroom_ids=>[@classroom1.id, @classroom2.id], :subject_ids=>[@subject1.id,@subject2.id])
    @teacher2 = FactoryGirl.create(:teacher, :school_id=>@school1.id, :classroom_ids=>[@classroom2.id], :subject_ids=>[@subject1.id,@subject2.id])
  end
  context "GET index" do
    before(:each) do
      @student = FactoryGirl.create(:student, :school_id=>@school1.id, :classroom_id=>@classroom2.id, :teacher_ids=>[@teacher1.id,@teacher2.id], :subject_ids=>[@subject1.id,@subject2.id])
    end
    it "should assign @students" do
      get :index
      expect(assigns(:students)).to eq([@student])
    end
    it "should renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  context "GET new" do
    it "should assign a new student to @student" do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
      response.status.should eq 200
    end
  end
  context "POST create" do
    before(:each) do
      @student = FactoryGirl.build(:student, :school_id=>@school1.id, :classroom_id=>@classroom1.id)
      @student.teachers<<@teacher1
      @student.teachers<<@teacher2
      @student.subjects<<@subject1
      @student.subjects<<@subject2
    end
    it "should be success and create a student" do
      attributes=@student.attributes.merge(:teacher_ids=>@student.teacher_ids,:subject_ids=>@student.subject_ids)
      post :create, :student=>attributes
      response.status.should eq 201
    end
    it "should not success if invalid params are passed" do
      attributes=@student.attributes.merge(:teacher_ids=>@student.teacher_ids,:subject_ids=>@student.subject_ids)
      attributes["zipcode"]="asdf"
      attributes["name"]=nil
      post :create, :student=>attributes
      response.status.should eq 422
    end
  end
  context "PUT update" do
    before(:each) do
      @student = FactoryGirl.create(:student, :school_id=>@school1.id, :classroom_id=>@classroom2.id, :teacher_ids=>[@teacher1.id,@teacher2.id], :subject_ids=>[@subject1.id,@subject2.id])
    end
    context "valid attributes" do
      it "should loacte the requested @student" do
        put :update, id: @student, student: FactoryGirl.attributes_for(:student)
        assigns(:student).should eq(@student)
      end
      it "should changes @student's attributes" do
        put :update, id: @student, student: FactoryGirl.attributes_for(:student, father_name: "ABC", mother_name: "XYZ")
        @student.reload
        @student.father_name.should eq("ABC")
        @student.mother_name.should eq("XYZ")
      end

      it "should redirects to the updated student" do
        put :update, id: @student, student: FactoryGirl.attributes_for(:student)
        response.should redirect_to @student
      end
    end
    context "invalid attributes" do
      it "should not change @student's attributes and return 422" do
        student1 = @student
        put :update, id: @student, student: FactoryGirl.attributes_for(:student, father_name: "ABC", mother_name: nil)
        @student.reload
        @student.father_name.should eq student1["father_name"]
        response.status.should eq 422
      end
    end
  end
  context "DELETE  destroy" do
    before(:each) do
      @student = FactoryGirl.create(:student, :school_id=>@school1.id, :classroom_id=>@classroom2.id, :teacher_ids=>[@teacher1.id,@teacher2.id], :subject_ids=>[@subject1.id,@subject2.id])
    end
    it "should delete the student" do
      expect{
        delete :destroy, id: @student
      }.to change(Student,:count).by(-1)
    end

    it "should redirect to students#index" do
      delete :destroy, id: @student
      response.should redirect_to students_url
    end
  end
end
