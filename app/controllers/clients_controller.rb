class ClientsController < ApplicationController
 
  before_filter :authenticate_user!
  
  # GET /clients
  # GET /clients.json
  
  def index
    @clients = Client.all(:order => :name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, :notice => 'Client was successfully created.' }
        format.json { render :json => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, :notice => 'Client was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def retrieve_client_dac
    @client = Client.find(params[:id])
    render :json => @client.client_dac.to_json
  end
  
  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :ok }
    end
  end
  
  def pesquisa_nomes
    result = Client.all(:conditions=>["name like ?", params[:term] + '%'],
                        :select => 'name')
    render :json => result.map(&:name).to_json
  end
  
  def show_by_name
    @client = Client.find_by_name(params[:id])
    render 'show'
  end
  
  def id_by_name
    client = Client.find_by_name(params[:id])
    if client
      render :json => client.id
    else
      render :json => nil
    end
  end
end
