class InstructorsController < ApplicationController

  before_filter :authenticate_user! 

  # GET /instructors
  # GET /instructors.json
  def index
    if params[:initials]
      @instructors = Instructor.starting_with(params[:initials])
    else
      @instructors = Instructor.all(:order => :name)
  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @instructors }
    end
  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @instructor }
    end
  end
  def retrieve_instructor_dac
    @instructor = Instructor.find(params[:id])
    render :json => @instructor.instructor_dac.to_json
  end
  # GET /instructors/new
  # GET /instructors/new.json
  def new
    @instructor     = Instructor.new
    @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @instructor }
    end
  end

  # GET /instructors/1/edit
  def edit
    @instructor     = Instructor.find(params[:id])
    @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}
  end

  # POST /instructors
  # POST /instructors.json
  def create
    @instructor = Instructor.new(params[:instructor])

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, :notice => 'Instructor was successfully created.' }
        format.json { render :json => @instructor, :status => :created, :location => @instructor }
      else
        @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}

        format.html { render :action => "new" }
        format.json { render :json => @instructor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instructors/1
  # PUT /instructors/1.json
  def update
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      if @instructor.update_attributes(params[:instructor])
        format.html { redirect_to @instructor, :notice => 'Instructor was successfully updated.' }
        format.json { head :ok }
      else
        @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}

        format.html { render :action => "edit" }
        format.json { render :json => @instructor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy

    respond_to do |format|
      format.html { redirect_to instructors_url }
      format.json { head :ok }
    end
  end
end
