class BidsController < ApplicationController

  def new
    @bid = Bid.new
    @user = User.find(current_user)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bid }
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def create
    @event = Event.find_by_current(true)

    @bid = Bid.new(params[:bid])
    # @bid.bid_amount = @bid.bid_amount.round
    @bid.user_id = current_user.id if current_user

    if @bid.save
      redirect_to _my_bids_path, notice: 'Bid was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @bid = Bid.find(params[:id])

    respond_to do |format|
      if @bid.update_attributes(params[:bid])
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy

    respond_to do |format|
      format.html { redirect_to bids_url }
      format.json { head :no_content }
    end
  end
end