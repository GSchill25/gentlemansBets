class Member < ActiveRecord::Base
	has_one :user
	has_many :bets

	#nested form
  	accepts_nested_attributes_for :user, reject_if: lambda {|user| user[:username].blank? or user[:password].blank?}

	#validates_presence_of :last_name


	after_initialize :default_values

	def default_values
		self.number_of_bets ||= 0
		self.bets_won ||= 0
		return true
	end

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

	def count_wins
		all_bets = Bet.all.map{|b| b.winner}
		wins = 0
		all_bets.each do |b|
			if b == self.proper_name
				wins = wins +1
			end
		end
		self.bets_won = wins
		self.save
	end
end
