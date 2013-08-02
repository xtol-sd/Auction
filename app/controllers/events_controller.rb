class EventsController < ApplicationController

  def end_auction
    event = Event.find(1).update_attribute(:end_datetime => "2013:05:05 16:10:00 UTC")
    event.save
  end  

  def designate_current
    if !Event.all.nil?
      @event = Event.find_by_current(true)
      event_id = @event.id 
      Event.update_all :current => false 
      Event.find_by_id(event_id).update_attributes(:current => true) 
      Event.find_by_id(event_id).save!
    end
  end   

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @donations = Donation.all
    @event = Event.find_by_id(params[:id])
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def dashboard_report1
    @event = Event.find_by_current(true)
  end

  def dashboard_report2
    @event = Event.find_by_current(true)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find_by_current(true)
    @items = @event.items.all
    @bid = Bid.new
    @donations = Donation.all
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      Event.update_all(["current = ?", false], ['id <> ?', @event.id]) #Should update all where id is not event.id
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
