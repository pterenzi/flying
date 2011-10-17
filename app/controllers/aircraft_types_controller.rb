class AircraftTypesController < ApplicationController

  before_filter :authenticate_user! 

  def index
    @aircraft_types = AircraftType.all(:order => :name)
  end

  def show
    @aircraft_type = AircraftType.find(params[:id])
  end

  def new
    @aircraft_type = AircraftType.new()
  end

  def create
  end

  def edit
    @aircraft_type = AircraftType.find(params[:id])
  end

  def update
    @aircraft_type = AircraftType.find(params[:id])

    respond_to do |format|
      if @aircraft_type.update_attributes(params[:aircraft_type])
        format.html { redirect_to @aircraft_type, :notice => 'AircraftType was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @aircraft_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def busca_aircraft_type
    @aircraft_type = AircraftType.find(params[:id])
    
    render :json => @aircraft_type.to_json
  end


end
