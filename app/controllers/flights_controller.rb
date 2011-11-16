class FlightsController < ApplicationController

  before_filter :authenticate_user! 
  before_filter :get_current, :only => [:show, :print_notification]

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
    @aircrafts   = Aircraft.where(:aircraft_type_id => params[:aircraft_type_id]).collect{|c| [c.prefix, c.id]}
    @aircraft_type = AircraftType.find(params[:aircraft_type_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @flight }
    end
  end

  # GET /flights/1/edit
  def edit
    @flight      = Flight.find(params[:id])
    @aircraft_type = @flight.aircraft.aircraft_type
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
  
  
  def print_notification
    require "prawn"
    
    col0 = 5
    col1 = 155
    col2 = 305
    col3 = 455
    Prawn::Document.generate('hello.pdf') do |pdf| 
      pdf.font_size = 14
      pdf.draw_text "Notificação de Vôo", :at => [10, 640]
      pdf.horizontal_line 4, 510, :at => 630
      pdf.stroke
      
      y = 610
      pdf.font_size = 11
      pdf.draw_text "Tipo de formulário", :at => [col0,y]
      pdf.draw_text "Aeronave", :at => [col1,y]
      pdf.draw_text "Tipo", :at => [col2,y]

      pdf.font_size = 10
      y -= 15
      pdf.draw_text "IEPV 100-7", :at => [col0,y]
      pdf.draw_text @flight.aircraft.prefix, :at=> [col1,y]
      pdf.draw_text @flight.aircraft.aircraft_type.name, :at => [col2,y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Equipamento", :at => [col0,y]
      pdf.draw_text "Aeroporto de partida", :at => [col1, y]
      pdf.draw_text "Data do vôo", :at => [col2, y]
      pdf.draw_text "Hora", :at => [col3, y]

      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.equipment, :at => [col0, y]
      pdf.draw_text @flight.departure_aerodrome, :at => [col1, y]
      pdf.draw_text @flight.flight_date_br, :at => [col2, y]
      pdf.draw_text @flight.flight_time_br, :at => [col3, y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Velocidade de cruzeiro", :at => [col0,y]
      pdf.draw_text "Nível", :at => [col1, y]
      pdf.draw_text "Rota", :at => [col2, y]

      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.cruising_speed, :at => [col0, y]
      pdf.draw_text @flight.level, :at => [col1, y]
      pdf.draw_text @flight.route, :at => [col2, y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Aeroporto de destino", :at => [col0,y]
      pdf.draw_text "Total ett", :at => [col1, y]
      pdf.draw_text "Aeroporto alternativo", :at => [col2, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.destination_aerodrome, :at => [col0, y]
      pdf.draw_text @flight.total_ett, :at => [col1, y]
      pdf.draw_text @flight.alternate_aerodrome, :at => [col2, y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Cliente", :at => [col0,y]
      pdf.draw_text "ANAC Cliente", :at => [col1, y]
      pdf.draw_text "Instrutor", :at => [col2, y]
      pdf.draw_text "ANAC Instrutor", :at => [col3, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.client.name , :at => [col0, y]
      pdf.draw_text @flight.client.client_dac, :at => [col1, y]
      pdf.draw_text @flight.instructor.name, :at => [col2, y]
      pdf.draw_text @flight.instructor.instructor_dac, :at => [col3, y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Outras informações", :at => [col0,y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.other_information, :at => [col0, y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Cores e marcas da aeronave", :at => [col0,y]
      pdf.draw_text "Piloto em comando", :at => [col1, y]
      pdf.draw_text "Pessoas a bordo", :at => [col2, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.aircraft_colors_and_marks, :at => [col0, y]
      pdf.draw_text @flight.persons_on_board, :at => [col1, y]
      pdf.draw_text @flight.persons_on_board, :at => [col2, y]

      pdf.font_size = 11
      y -= 25
      pdf.draw_text "Preenchido por", :at => [col0,y]
      pdf.draw_text "Licença ANAC", :at => [col1, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.filled_by, :at => [col0, y]
      pdf.draw_text @flight.instructor_dac, :at => [col1, y]


    end
    send_file "hello.pdf"

  end

  private

  def get_current
    @flight = Flight.find(params[:id])
  end

end
