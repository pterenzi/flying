class AircraftTypesController < ApplicationController
  def index
    @aircraft_types = AircraftType.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def busca_aircraft_type
    @aircraft_type = AircraftType.find(params[:id])
    
    render :json => @aircraft_type.to_json
  end


end
