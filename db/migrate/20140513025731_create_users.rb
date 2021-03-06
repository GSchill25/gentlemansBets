class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :member_id
      t.string :password_digest
      t.string :role
      t.boolean :active

      t.timestamps
    end
  end
end
