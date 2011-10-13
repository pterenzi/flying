class ReceivesController < ApplicationController
  # GET /receives
  # GET /receives.json
  def index
    @receives = Receive.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @receives }
    end
  end

  # GET /receives/1
  # GET /receives/1.json
  def show
    @receive = Receive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @receive }
    end
  end

  # GET /receives/new
  # GET /receives/new.json
  def new
    @receive = Receive.new
    @clients = Client.all.collect{ |c| [c.name, c.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @receive }
    end
  end

  # GET /receives/1/edit
  def edit
    @receive = Receive.find(params[:id])
    @clients = Client.all.collect{ |c| [c.name, c.id] }
  end

  # POST /receives
  # POST /receives.json
  def create
    @receive = Receive.new(params[:receive])

    respond_to do |format|
      if @receive.save
        format.html { redirect_to @receive, :notice => 'Receive was successfully created.' }
        format.json { render :json => @receive, :status => :created, :location => @receive }
      else
        @clients = Client.all.collect{ |c| [c.name, c.id] }
        format.html { render :action => "new" }
        format.json { render :json => @receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receives/1
  # PUT /receives/1.json
  def update
    @receive = Receive.find(params[:id])

    respond_to do |format|
      if @receive.update_attributes(params[:receive])
        format.html { redirect_to @receive, :notice => 'Receive was successfully updated.' }
        format.json { head :ok }
      else
        @clients = Client.all.collect{ |c| [c.name, c.id] }
        format.html { render :action => "edit" }
        format.json { render :json => @receive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receives/1
  # DELETE /receives/1.json
  def destroy
    @receive = Receive.find(params[:id])
    @receive.destroy

    respond_to do |format|
      format.html { redirect_to receives_url }
      format.json { head :ok }
    end
  end
end
