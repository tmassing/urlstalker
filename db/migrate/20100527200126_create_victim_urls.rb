class CreateVictimUrls < ActiveRecord::Migration
  def self.up
    create_table :victim_urls do |t|
      t.string :name
      t.string :url
      t.string :query

      t.timestamps
    end
  end

  def self.down
    drop_table :victim_urls
  end
end
