class Member < ActiveRecord::Base
	has_one :user
	has_many :bets

	#nested form
  	accepts_nested_attributes_for :user, reject_if: lambda {|user| user[:username].blank? or user[:password].blank?}

	validates_presence_of :first_name, :last_name, :date_of_birth

	# instance methods
	def name
	  last_name + ", " + first_name
	end
	  
	def proper_name
	  first_name + " " + last_name
	end

	def age
	    return nil if date_of_birth.blank?
	    (Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
	end
end
