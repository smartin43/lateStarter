class Swap < ActiveRecord::Base
  belongs_to :taker, foreign_key: 'taker_id', class_name: 'User'
  belongs_to :shift, foreign_key: 'shift_id', class_name: 'Shift'
  validates_presence_of :shift
end
