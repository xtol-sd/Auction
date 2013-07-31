class Event < ActiveRecord::Base
  attr_accessible :end_datetime, :name, :start_datetime, :current, :donations_startdate
  has_many :items

#need to test the item bid information partial for when the auction ends
  def finished?
  	end_datetime <= DateTime.now
  end

  def select_all(report)
  	ActiveRecord::Base.connection.select_all(report)
  end

  def status_report
    select_all("select i.title, i.start_bid, u.name, u.email,
      (CASE WHEN (d.status=0) THEN 'PENDING'
      WHEN (d.status=1) THEN 'APPROVED'
      WHEN (D.status=2) THEN 'REJECTED' END) as STATUS
      from donations d
      left outer join items i on i.id=d.item_id
      left outer join users u on u.id=d.user_id")
  end
  
  def top_bid_report
  	select_all("select i.title, i.start_bid, count(b.id) as number_of_bids,
    MAX(bid_amount) as highest_bid,
    u.name as highest_bidder,
    u.email as bidder_email
    from items i
    left outer join bids b on i.id = b.item_id
    left outer join users u on u.id = b.user_id
    where b.item_id = i.id
    group by i.id, u.email, u.name")
  end

end