class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :petitioner
      t.text :petition_text
      t.string :tweet_text
      t.text :phone_script
      t.integer :tweets
      t.integer :calls
      t.integer :emails
      t.timestamps null: false
    end
  end
end
