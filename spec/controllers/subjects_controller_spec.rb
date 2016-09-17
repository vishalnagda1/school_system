require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  before(:each) do
    @school1 = FactoryGirl.create(:school)
    @classroom1 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
    @classroom2 = FactoryGirl.create(:classroom, :school_id=>@school1.id)
  end
  context "GET index" do
    before(:each) do
      @subject = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id, @classroom2.id])
    end
    it "should assigns @subjects" do
      get :index
      expect(assigns(:subjects)).to eq([@subject])
    end
    it "should renders the index template" do
      get :index
      # expect(response).to render_template("index")
      response.should render_template :index
    end
  end
  context "GET new" do
    it "should assign a new subject to @subject" do
      get :new
      expect(assigns(:subject)).to be_a_new(Subject)
      response.status.should eq 200
    end
  end
  context "POST create" do
    before(:each) do
      @subject = FactoryGirl.build(:subject)
      @subject.classrooms<<@classroom1
      @subject.classrooms<<@classroom2
      @subject.schools<<@school1
    end
    it "should be success" do
      # p @subject
      # p @subject.classrooms
      # p @subject.classroom_ids
      attributes=@subject.attributes.merge(:classroom_ids=>@subject.classroom_ids,:school_ids=>@subject.school_ids)
      post :create, :subject=>attributes
      response.status.should eq 201
    end
    it "should not success" do
      # pending("with numeric validation it's not working")
      attributes=@subject.attributes.merge(:classroom_ids=>@subject.classroom_ids)#,:school_ids=>["ABC"]
      post :create, :subject=>attributes
      response.status.should eq 422
    end
  end
  context "PUT update" do
    before(:each) do
      @subject = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id, @classroom2.id])
    end
    it "should success" do
      put :update, id:@subject.id, :subject=>{:name=>'RSpec'}
      response.status.should eq 200
    end
    it "should not success" do
      put :update, id:@subject.id, :subject=>{:name=>""}
      response.status.should eq 422
    end
  end
  context "DELETE destroy" do
    before(:each) do
      @subject = FactoryGirl.create(:subject, :school_ids=>[@school1.id], :classroom_ids=>[@classroom1.id, @classroom2.id])
    end

    it "should delete the subject" do
      expect{
        delete :destroy, id: @subject
      }.to change(Subject,:count).by(-1)
    end

    it "should redirect to index" do
      delete :destroy, id: @subject
      response.should redirect_to subjects_url
    end
  end
end
