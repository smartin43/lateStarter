class Shift < ActiveRecord::Base
  validates :start_time, :end_time, :user, presence: true
  belongs_to :user
  has_one :swap

  def start_before_end?
    DateTime.parse(:start_time.to_s) == DateTime.parse(:end_time.to_s)
  end

  def swap_status
    if Swap.exists?(shift_id: self.id)
      swap = Swap.where(shift_id: self.id).first!
      if swap.taker
        return "pending"
      end
      return "up"
    else
      return "down"
    end
  end

  def pretty_time
    s_time = DateTime.strptime(self.start_time, "%m/%d/%Y %H:%M %p")
    s_time = s_time.strftime("%l:%M %P")
    e_time = DateTime.strptime(self.end_time, "%m/%d/%Y %H:%M %p")
    e_time = e_time.strftime("%l:%M %P")
    s_time + " - " + e_time
  end

  def pretty_date
    date = DateTime.strptime(self.start_time, "%m/%d/%Y %H:%M %p")
    date = date.strftime("%A, %B %e")
    date
  end
end
