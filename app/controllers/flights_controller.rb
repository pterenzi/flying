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
     
      pdf.fill_color "FFFFCC" # RGB
      pdf.fill_polygon [1, 675], [550, 675], 
                   [550, 325], [1, 325]
      
      pdf.stroke_color "000000" #50, 100, 0, 0 # CMYK
      pdf.stroke_rectangle [1, 676], 550, 350
     
      pdf.fill_color "000000" # RGB
      pdf.font_size = 14
      pdf.draw_text "Notificação de Vôo", :at => [10, 640]
      pdf.horizontal_line 1, 550, :at => 630
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
      y -= 22
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
      y -= 22
      pdf.draw_text "Velocidade de cruzeiro", :at => [col0,y]
      pdf.draw_text "Nível", :at => [col1, y]
      pdf.draw_text "Rota", :at => [col2, y]

      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.cruising_speed, :at => [col0, y]
      pdf.draw_text @flight.level, :at => [col1, y]
      pdf.draw_text @flight.route, :at => [col2, y]

      pdf.font_size = 11
      y -= 22
      pdf.draw_text "Aeroporto de destino", :at => [col0,y]
      pdf.draw_text "Total ett", :at => [col1, y]
      pdf.draw_text "Aeroporto alternativo", :at => [col2, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.destination_aerodrome, :at => [col0, y]
      pdf.draw_text @flight.total_ett, :at => [col1, y]
      pdf.draw_text @flight.alternate_aerodrome, :at => [col2, y]

      pdf.font_size = 11
      y -= 22
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
      y -= 22
      pdf.draw_text "Outras informações", :at => [col0,y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.other_information, :at => [col0, y]

      pdf.font_size = 11
      y -= 22
      pdf.draw_text "Cores e marcas da aeronave", :at => [col0,y]
      pdf.draw_text "Piloto em comando", :at => [col1, y]
      pdf.draw_text "Pessoas a bordo", :at => [col2, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.aircraft_colors_and_marks, :at => [col0, y]
      pdf.draw_text @flight.persons_on_board, :at => [col1, y]
      pdf.draw_text @flight.persons_on_board, :at => [col2, y]

      pdf.font_size = 11
      y -= 22
      pdf.draw_text "Preenchido por", :at => [col0,y]
      pdf.draw_text "Licença ANAC", :at => [col1, y]
      pdf.font_size = 10
      y -= 15
      pdf.draw_text @flight.filled_by, :at => [col0, y]
      pdf.draw_text @flight.instructor_dac, :at => [col1, y]

      print_level(pdf)
      print_history(pdf)
    end
    send_file "hello.pdf"

  end

  private

  def print_history(pdf)
    pdf.fill_color "F0F0F0" # RGB
    pdf.fill_polygon [1, 290], [110, 290], 
                 [110, 10], [1, 10]
    
    pdf.stroke_color "000000" #50, 100, 0, 0 # CMYK
    pdf.stroke_rectangle [1, 291], 110, 280
   
    pdf.fill_color "000000"
    pdf.draw_text "Histórico:", :at => [3,280]
    pdf.draw_text "(  ) Instrução", :at => [5,265]
    pdf.draw_text "(  ) Transporte", :at => [5,250]
    pdf.draw_text "(  ) Manutenção", :at => [5,235]
    pdf.draw_text "(  ) Treinamento", :at => [5,220]
    pdf.horizontal_line 1, 110, :at => 210
    pdf.stroke

    pdf.fill_color "000000"
    pdf.draw_text "Fase:", :at => [3,200]
    pdf.draw_text "(  ) Pré-solo", :at => [5,185]
    pdf.draw_text "(  ) Manobras", :at => [5,170]
    pdf.draw_text "(  ) Navegação", :at => [5,155]
    pdf.draw_text "(  ) Solo", :at => [5,140]
    pdf.draw_text "(  ) Cheque", :at => [5,125]
    pdf.horizontal_line 1, 110, :at => 115
    pdf.stroke

    pdf.fill_color "000000"
    pdf.draw_text "Curso:", :at => [3,100]
    pdf.draw_text "(  ) PPH", :at => [5,85]
    pdf.draw_text "(  ) PCH", :at => [5,70]
    pdf.draw_text "(  ) INVH", :at => [5,55]
    pdf.draw_text "(  ) CPD", :at => [5,40]
    pdf.draw_text "(  ) CPR", :at => [5,25]


    
  end
  
  def print_level(pdf)
    pdf.fill_color "F0F0F0" # RGB
    pdf.fill_polygon [1, 315], [550, 315], 
                 [550, 295], [1, 295]
    
    pdf.stroke_color "000000" #50, 100, 0, 0 # CMYK
    pdf.stroke_rectangle [1, 316], 550, 20
   
    pdf.fill_color "000000" # RGB
    pdf.draw_text "Grau", :at => [100,305]
    pdf.draw_text "(  ) Perigoso", :at => [140,305]
    pdf.draw_text "(  ) Deficiente", :at => [210,305]
    pdf.draw_text "(  ) Satisfatorio", :at => [280,305]
    pdf.draw_text "(  ) Bom", :at => [350,305]
    pdf.draw_text "(  ) Excelente", :at => [400,305]
    case
      when @flight.degree == 1 
        col_x = 142
      when @flight.degree == 2 
        col_x = 210
      when @flight.degree == 3 
        col_x = 282
      when @flight.degree == 4 
        col_x = 352
      when @flight.degree == 5 
        col_x = 402
    end
    pdf.draw_text "X", :at => [col_x, 305]
  end

  def get_current
    @flight = Flight.find(params[:id])
  end

end
