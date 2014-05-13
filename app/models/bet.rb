class Bet < ActiveRecord::Base
	belongs_to :member

	validates_presence_of :name, :description, :user_id, :challengee


end