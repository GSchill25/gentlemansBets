class Bet < ActiveRecord::Base
	belongs_to :member

	validates_presence_of :name, :description, :member_id, :challengee

	scope :accepted, -> {where(accepted: true)}
	scope :for_member, -> (member_id){ where("member_id = ?", member_id)}
	scope :to_accept, -> (member_id){ where("challengee_id = ? and accepted = ?", member_id, false)}
	scope :pending, -> (member_id){ where("member_id = ? and accepted = ?", member_id, false)}

	def update_accept
		self.accepted = true
		self.save
	end
	


end