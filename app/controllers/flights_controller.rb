class FlightsController < ApplicationController

  before_filter :authenticate_user! 

  # GET /flights
  # GET /flights.json
  def index
    date_params
    @flights     = Flight.between_date(@start_date.to_date, @end_date.to_date)
    if params[:instructor_id] && params[:instructor_id].to_i > 0
      @flights = @flights.by_instructor(params[:instructor_id])
    end
    if params[:client_id] && params[:client_id].to_i > 0
      @flights = @flights.by_client(params[:client_id])
    end
    if params[:aircraft_id] && params[:aircraft_id].to_i > 0
      @flights = @flights.by_aircraft(params[:aircraft_id])
    end

    @instructors = Instructor.all.collect{ |i| [i.name, i.id] }
    @clients     = Client.all.collect{ |c| [c.name, c.id] }
    @aircrafts   = Aircraft.all.collect{ |a| [a.prefix, a.id] }
    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.json { render :json => @flights }
    end
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @flight }
    end
  end

  # GET /flights/new
  # GET /flights/new.json
  def new
    @flight      = Flight.new(:duration => 2, :aircraft => @aircraft)
    @clients     = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
    @instructors = Instructor.all(:order=>:name).collect{|c| [c.name, c.id]}
    @aircrafts   = Aircraft.where (:aircraft_type_id => params[:aircraft_type_id]).collect{|c| [c.prefix, c.id]}
    @aircraft_type = AircraftType.find(params[:aircraft_type_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @flight }
    end
  end

  # GET /flights/1/edit
  def edit
    @flight      = Flight.find(params[:id])
    @clients     = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
    @instructors = Instructor.all(:order=>:name).collect{|c| [c.name, c.id]}
    @aircrafts   = Aircraft.all.collect{|c| [c.prefix, c.id]}
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(params[:flight])
    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, :notice => 'Flight was successfully created.' }
        format.json { render :json => @flight, :status => :created, :location => @flight }
      else
        format.html { render :action => "new" }
        format.json { render :json => @flight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flights/1
  # PUT /flights/1.json
  def update
    @flight = Flight.find(params[:id])

    respond_to do |format|
      if @flight.update_attributes(params[:flight])
        format.html { redirect_to @flight, :notice => 'Flight was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @flight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight  = Flight.find(params[:id])
    @balance = Balance.find_by_fligth_id(@flight.id)
    @flight.destroy
    @balance.destroy

    respond_to do |format|
      format.html { redirect_to flights_url }
      format.json { head :ok }
    end
  end
  
  def load_aircraft_type_form
    @aircraft = Aircraft.find(params[:id])
    case @aircraft.aircraft_type.name
    when 'Ultra-leve': render :partial => 'formU', :locals => {:f => params[:f]}
    when 'Autogyro': render :partial => 'formA', :locals => {:f => params[:f]}
    when 'Helicóptero': render :partial => 'formH', :locals => {:f => params[:f]}
    end
  end
  
end
