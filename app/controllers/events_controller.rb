class EventsController < ApplicationController

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

  def show
    @event = Event.find_by_current(true)
    @future_events = Event.where(["donations_startdate >=?", DateTime.now])
    if @event
      @items = @event.items.all
    end
    @bid = Bid.new
    @donations = Donation.all
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      Event.update_all(["current = ?", false], ['id <> ?', @event.id]) #Should update all where id is not event.id
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
