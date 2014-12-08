class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :password_digest, :access, :username
  validates_uniqueness_of :username
  validates :access, :inclusion => { :in => 1..2 }
  has_many :shifts
  has_many :swaps
  has_secure_password

  def full_name
    first_name + " " + last_name
  end

  def week_shifts
    shifts = Shift.where("start_time >= ? AND start_time <= ? AND user_id == ?", Date.today.beginning_of_week, Date.today.end_of_week, self.id)
    arr = ["-","-","-","-","-","-","-"]
    shifts.each do |shift|
      arr.insert_at((DateTime.strptime(shift.start_time,"%m/%d/%Y %H:%M %p")).wday, shift.pretty_time)
    end
    arr
    #return shifts
  end
end
