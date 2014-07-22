class AddBrokerToBets < ActiveRecord::Migration
  def change
    add_column :bets, :broker_id, :integer
  end
end
