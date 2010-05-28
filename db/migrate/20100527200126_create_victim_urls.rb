class CreateVictimUrls < ActiveRecord::Migration
  def self.up
    create_table :victim_urls do |t|
      t.string :name
      t.string :url
      t.string :query
      t.boolean :links_only, :default => false
      t.boolean :content_only, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :victim_urls
  end
end
