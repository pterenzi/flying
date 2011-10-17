class PackagesController < ApplicationController
  
  before_filter :authenticate_user! 

  # GET /packages
  # GET /packages.json
  def index
    @packages       = Package.all(:order => :name)
    @aircratf_types = AircraftType.all.collect{|c| [c.name, c.id]}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @packages }
    end
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package = Package.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @package }
    end
  end

  # GET /packages/new
  # GET /packages/new.json
  def new
    @package        = Package.new
    @aircraft_types = AircraftType.by_name.collect{|c| [c.name, c.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @package }
    end
  end

  # GET /packages/1/edit
  def edit
    @package        = Package.find(params[:id])
    @aircraft_types = AircraftType.by_name.collect{|c| [c.name, c.id]}

  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(params[:package])

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, :notice => 'Package was successfully created.' }
        format.json { render :json => @package, :status => :created, :location => @package }
      else
        @aircraft_types = AircraftType.by_name.collect{|c| [c.name, c.id]}

        format.html { render :action => "new" }
        format.json { render :json => @package.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /packages/1
  # PUT /packages/1.json
  def update
    @package = Package.find(params[:id])

    respond_to do |format|
      if @package.update_attributes(params[:package])
        format.html { redirect_to @package, :notice => 'Package was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @package.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    respond_to do |format|
      format.html { redirect_to packages_url }
      format.json { head :ok }
    end
  end
  
  def busca_pacote
    @package = Package.find(params[:id])
    
    render :json => @package.to_json
  end
end
