class Result < ActiveRecord::Base
  belongs_to :patient
	
	validates_presence_of :patient_id, :encode
  
  attr_accessible :encode, :patient_id, :decode
  
end
