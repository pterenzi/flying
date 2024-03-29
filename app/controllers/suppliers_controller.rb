class SuppliersController < ApplicationController

  before_filter :authenticate_user! 

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @suppliers }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @supplier }
    end
  end

  # GET /suppliers/new
  # GET /suppliers/new.json
  def new
    @supplier = Supplier.new(:active => true)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, :notice => 'Supplier was successfully created.' }
        format.json { render :json => @supplier, :status => :created, :location => @supplier }
      else
        format.html { render :action => "new" }
        format.json { render :json => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.json
  def update
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        format.html { redirect_to @supplier, :notice => 'Supplier was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to suppliers_url }
      format.json { head :ok }
    end
  end
  
  def search_names
    result = Supplier.all(:conditions=>["name like ?", params[:term] + '%'],
                        :select => 'name')
    render :json => result.map(&:name).to_json
  end

  def show_by_name
    @supplier = Supplier.find_by_name(params[:id])
    render 'show'
  end

  def id_by_name
    supplier = Supplier.find_by_name(params[:id])
    if supplier
      render :json => supplier.id
    else
      render :json => nil
    end
  end
  
end
