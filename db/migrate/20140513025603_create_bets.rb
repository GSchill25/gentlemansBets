class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :name
      t.string :description
      t.string :winner
      t.integer :member_id
      t.integer :memeber_one_confidence
      t.integer :member_two_confidence
      t.string :challengee
      t.integer :challengee_id
      t.boolean :accepted
      t.integer :video_id
      t.boolean :active

      t.timestamps
    end
  end
end
