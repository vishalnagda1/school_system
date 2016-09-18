class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  def show
    #@teacher = Teacher.find(params[:id])

    # @teacher = Teacher.find(params[:id])
    # if @teacher
    #   render :json => @teacher.to_json(:methods => [:subject_details]), :status => :ok
    # else
    #   render :nothing => true, :status => :unprocessable_entity
    # end
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
    # @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  def create
    teacher_params=(params.require(:teacher).permit(:name, :gender, :phone, :school_id)).merge(:classroom_ids=>params[:teacher][:classroom_ids],:subject_ids=>params[:teacher][:subject_ids])
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.', status: :created
    else
      # p @teacher.errors
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.', status: :ok
    else
      # p @teacher.errors
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.require(:teacher).permit(:name, :gender, :phone, :school_id)
    end
end
