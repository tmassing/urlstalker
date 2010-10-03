class AddEnabledToVictimUrls < ActiveRecord::Migration
  def self.up
    add_column :victim_urls, :enabled, :boolean, :default => true
  end

  def self.down
    remove_column :victim_urls, :enabled
  end
end
