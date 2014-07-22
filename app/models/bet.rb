class Bet < ActiveRecord::Base
	belongs_to :member

	validates_presence_of :name, :description, :member_id

	scope :accepted, -> {where(accepted: true)}
	scope :for_member, lambda {|member_id| where("member_id = ?", member_id)}
	scope :to_accept, lambda {|member_id| where("challengee_id = ? and accepted = ?", member_id, false)}
	scope :pending, lambda {|member_id| where("member_id = ? and accepted = ?", member_id, false)}

	before_save :default_values

	def default_values
		self.accepted = false
	end

	def update_accept
		self.accepted = true
		self.save
	end
	


end