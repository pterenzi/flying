class AccountsController < ApplicationController
  
  
  # GET /accounts
  # GET /accounts.json
  def index
    date_params
    @payments   = Account.payments.between_dates(@start_date.to_date, @end_date.to_date).pay_by_date
    @suppliers  = Supplier.all.collect{ |s| [s.name, s.id] }

    if params[:supplier_id] && params[:supplier_id].to_i > 0
      @payments = @payments.by_supplier(params[:supplier_id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account   = Account.new()
    @account.payment_date = Date.today
    debugger
    @clients   = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
    @suppliers = Supplier.all(:order=>:name).collect{|c| [c.name, c.id]}
    @packages  = Package.actives.collect{|c| [c.name, c.id]}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account   = Account.find(params[:id])
    @clients   = Client.all(:order=>:name).collect{|c| [c.name, c.id]}
    @suppliers = Supplier.all(:order=>:name).collect{|c| [c.name, c.id]}
    @packages  = Package.actives.collect{|c| [c.name, c.id]}
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    @account.description = params[:account][:description]
    @account.value = params[:account][:value]
debugger
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, :notice => 'Account was successfully created.' }
        format.json { render :json => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.json { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, :notice => 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end
  
  
  def cash_flow
    date_params
    @sales      = Entry.between_date(@start_date.to_date, @end_date.to_date)
    @payments   = Account.payments.between_dates(@start_date.to_date, @end_date.to_date).pay_by_date
    @clients    = Client.all.collect{ |c| [c.name, c.id] }
    @suppliers  = Supplier.all.collect{ |s| [s.name, s.id] }

    if params[:client_id] && params[:client_id].to_i > 0
      @sales = @sales.by_client(params[:client_id])
    end

    if params[:supplier_id] && params[:supplier_id].to_i > 0
      @payments = @payments.by_supplier(params[:supplier_id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accounts }
    end
  end
end
