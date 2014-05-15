class Bet < ActiveRecord::Base
	belongs_to :member

	validates_presence_of :name, :description, :user_id, :challengee

	scope :accepted, -> {where(accepted: true)}
	scope :for_member, -> (member_id){ where("member_id = ?", member_id)}


end