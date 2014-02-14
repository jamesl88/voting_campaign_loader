class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :time
      t.string :campaign_id
      t.string :validity
      t.string :choice
      

      t.timestamps
    end
  end
end
