class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]



def index
    @schools = School.all
  end

  # GET /schools/1/students/1
  def show
  end

  # GET /schools/1/students/new
  def new
    @school = School.new
  end

  # GET /schools/1/students/1/edit
  def edit
  end

  # POST /schools/1/students
  def create
    @school = School.new(school_params)
    
    if @school.save
      redirect_to @school, notice: 'New School is created'
    else
      render :new
    end
  end

  # PUT/PATCH /schools/1/students/1
  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School is updated'
    else
      render :edit
    end
  end

  # DELETE /schools/1/students/1
  def destroy
    @school.destroy
    redirect_to school_path(@school), notice: 'School is deleted'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end
 
    def school_params
      params.require(:school).permit(:name, :address, :principle, :capacity, :private_school)
    end
end
