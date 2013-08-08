class ItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def my_bids
     @items = Item.all
     @bids = Bid.find_all_by_user_id(current_user)
     @bid = Bid.new
     @event = Event.find_by_current(true)
  end

  def my_donations
     @items = Item.all
     @donations = Donation.find_all_by_user_id(current_user)
     @event = Event.find_by_current(true) 
  end

  def show
    @item = Item.find(params[:id])
    @bid = Bid.new
    @event = Event.find_by_current(true)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def new
    @event = Event.find_by_current(true)
    @item = @event.items.build
    @user = User.find(current_user)
    
    @donation = @item.build_donation
  end

  def edit
    @event = Event.find_by_current(true)
    @item = Item.find(params[:id])
    @user = User.find(current_user)  
  end

  def create
    @user = User.find(current_user)
    @event = Event.find(params[:event_id])
    @item = @event.items.build(params[:item])
 
    respond_to do |format|
      if @item.save
        Photo.create(:item_id => @item.id, :image => "default_image.png")
        format.html { redirect_to edit_event_item_path(@event,@item), notice: 'Item text was submitted for approval. Would you like to add a photo?' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @event = Event.find_by_current(true)
    @user = User.find(current_user)
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to _my_donations_path, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find_by_current(true)
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to _my_donations_path, notice: 'Item was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end