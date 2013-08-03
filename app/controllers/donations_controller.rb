class DonationsController < ApplicationController
 
  def show
    @event = Event.find_by_current(true)
    @donation = Donation.find(params[:id])
    @item = Item.find(@donation.item_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to events_path, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

end
