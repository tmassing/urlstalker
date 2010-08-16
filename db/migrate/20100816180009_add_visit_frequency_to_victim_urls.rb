class AddVisitFrequencyToVictimUrls < ActiveRecord::Migration
  def self.up
    add_column :victim_urls, :visit_frequency, :string, :default => "daily"
  end

  def self.down
    remove_column :victim_urls, :visit_frequency
  end
end
