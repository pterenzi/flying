class SalesController < ApplicationController
  
  before_filter :authenticate_user! 
  # GET /sales
  # GET /sales.json
  def index
    date_params
    @sales = Sale.between_date(@start_date.to_date, @end_date.to_date).order(:date)
    if params[:client_id] && params[:client_id].to_i > 0
      @sales = @sales.by_client(params[:client_id])
    end
    @clients     = Client.all.collect{ |c| [c.name, c.id] }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale      = Sale.new(:date=>Date.today)
    @clients   = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
    @packages  = Package.actives.collect{|c| [c.name, c.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale     = Sale.find(params[:id])
    @clients  = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
    @packages = Package.actives.collect{|c| [c.name, c.id]}

  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        # format.html { redirect_to @sale, :notice => 'Sale was successfully created.' }
        format.json { render :json => @sale, :status => :created, :location => @sale }
        format.html {redirect_to new_entry_path(:client_id=> @sale.client_id, 
                        :date => @sale.date, :value => @sale.value * @sale.hours, 
                        :description=>@sale.package.name)}
      else
        @clients   = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
        @packages  = Package.actives.collect{|c| [c.name, c.id]}
        
        format.html { render :action => "new" }
        format.json { render :json => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, :notice => 'Sale was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :ok }
    end
  end
end
