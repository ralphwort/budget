class Item < ActiveRecord::Base

  def self.week_total(week)
    week_total = 0
    Item.all.each do |item|
      week_no = item.created_at.strftime("%U").to_i
      if (week_no == week)
        week_total += item.amount
      end
    end
    week_total
  end

  def self.find_by_week(week)
		Item.where("created_at >= ? and created_at <= ?", Date.commercial(2014,week), Date.commercial(2014,week + 2))
  end

end
