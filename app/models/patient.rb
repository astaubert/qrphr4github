class Patient < ActiveRecord::Base
  attr_accessible :first, :key, :last, :id, :test_data
  validates :key, length: { is: 32 }
  validates :test_data, length: { is: 16 }
  
  validates :id, presence: true
  validates :id, uniqueness: true
  
  validates :last, presence: true
  validates :first, presence: true
  
end
