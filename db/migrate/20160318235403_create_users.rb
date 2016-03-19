class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :u_id
      t.string :email
      t.string :name
      t.string :token
      t.integer :high_score

      t.timestamps null: false
    end
  end
end
