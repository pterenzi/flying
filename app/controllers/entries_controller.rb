class EntriesController < ApplicationController

  before_filter :authenticate_user! 


  # GET /entries
  # GET /entries.json
  def index
    date_params
    if params[:confirmed] == 'não'
      @entries = Entry.between_due_dates(@start_date.to_date, @end_date.to_date).order(:due_date).not_confirmed
    else
      @entries = Entry.between_entry_dates(@start_date.to_date, @end_date.to_date).order(:entry_date).confirmed
    end
    if params[:client_id] && params[:client_id].to_i > 0
      @entries = @entries.by_client(params[:client_id])
    end
    if params[:aircraft_type_id] && params[:aircraft_type_id].to_i > 0
      @entries = @entries.by_aircraft_type(params[:aircraft_type_id])
    end
    # @entries = @entries.confirmed if params[:confirmed] == 'sim'
    # @entries = @entries.not_confirmed if params[:confirmed] == 'não'
    @clients        = Client.all.collect{ |c| [c.name, c.id] }
    @aircraft_types = AircraftType.all(:order => :name).collect{|c| [c.name, c.id]}
    @titulo = "Recebimento entre #{@start_date} e #{@end_date}"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new(:client_id   => params[:client_id],
                       :due_date    => params[:date],
                       :value       => params[:value],
                       :description => params[:description])
    
    @clients        = Client.all.collect{ |c| [c.name, c.id] }
    @aircraft_types = AircraftType.all(:order => :name).collect{|c| [c.name, c.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry          = Entry.find(params[:id])
    @clients        = Client.all.collect{ |c| [c.name, c.id] }
    @aircraft_types = AircraftType.all(:order => :name).collect{|c| [c.name, c.id]}

  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, :notice => 'Entry was successfully created.' }
        format.json { render :json => @entry, :status => :created, :location => @entry }
      else
        @clients        = Client.all.collect{ |c| [c.name, c.id] }
        @aircraft_types = AircraftType.all(:order => :name).collect{|c| [c.name, c.id]}
         
        format.html { render :action => "new" }
        format.json { render :json => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, :notice => 'Entry was successfully updated.' }
        format.json { head :ok }
      else
        @clients        = Client.all.collect{ |c| [c.name, c.id] }
        @aircraft_types = AircraftType.all(:order => :name).collect{|c| [c.name, c.id]}

        format.html { render :action => "edit" }
        format.json { render :json => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    debugger
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

end
