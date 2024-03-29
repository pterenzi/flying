class AircraftsController < ApplicationController
  
  before_filter :authenticate_user! 

  # GET /aircrafts
  # GET /aircrafts.json
  def index
    if params[:initials]
      @aircrafts = Aircraft.starting_with(params[:initials])
    else
      @aircrafts = Aircraft.all
    end
  end


  # GET /aircrafts/1
  # GET /aircrafts/1.json
  def show
    @aircraft = Aircraft.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @aircraft }
    end
  end

  # GET /aircrafts/new
  # GET /aircrafts/new.json
  def new
    @aircraft       = Aircraft.new
    @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @aircraft }
    end
  end

  # GET /aircrafts/1/edit
  def edit
    @aircraft       = Aircraft.find(params[:id])
    @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}
  end

  # POST /aircrafts
  # POST /aircrafts.json
  def create
    @aircraft = Aircraft.new(params[:aircraft])

    respond_to do |format|
      if @aircraft.save
        format.html { redirect_to @aircraft, :notice => 'Aircraft was successfully created.' }
        format.json { render :json => @aircraft, :status => :created, :location => @aircraft }
      else
        @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}

        format.html { render :action => "new" }
        format.json { render :json => @aircraft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aircrafts/1
  # PUT /aircrafts/1.json
  def update
    @aircraft = Aircraft.find(params[:id])

    respond_to do |format|
      if @aircraft.update_attributes(params[:aircraft])
        format.html { redirect_to @aircraft, :notice => 'Aircraft was successfully updated.' }
        format.json { head :ok }
      else
        @aircraft_types = AircraftType.by_name.collect{|at| [at.name, at.id]}

        format.html { render :action => "edit" }
        format.json { render :json => @aircraft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aircrafts/1
  # DELETE /aircrafts/1.json
  def destroy
    @aircraft = Aircraft.find(params[:id])
    @aircraft.destroy

    respond_to do |format|
      format.html { redirect_to aircrafts_url }
      format.json { head :ok }
    end
  end
  
  def retrieve_aircraft_type_name
    @aircraft = Aircraft.find(params[:id])
    render :json => @aircraft.aircraft_type.name.to_json
  end
end
