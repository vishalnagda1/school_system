class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    attr=(params.require(:subject).permit(:name)).merge(:classroom_ids=>params[:subject][:classroom_ids],:school_ids=>params[:subject][:school_ids])
    @subject = Subject.new(attr)
    p @subject
    if @subject.save
      redirect_to @subject, notice: 'Subject was successfully created.', status: :created
    else
      p @subject.errors
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated.', status: :ok
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.require(:subject).permit(:name, :school_ids, :classroom_ids)
    end
end
