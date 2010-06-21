class AddGistIdToVictimUrls < ActiveRecord::Migration
  def self.up
    add_column :victim_urls, :gist_id, :string
  end

  def self.down
    remove_column :victim_urls, :gist_id
  end
end
