class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :number_of_bets
      t.integer :bets_won
      t.boolean :active

      t.timestamps
    end
  end
end
