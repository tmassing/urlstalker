class AddUserIdToVictimUrls < ActiveRecord::Migration
  def self.up
    add_column :victim_urls, :user_id, :integer
  end

  def self.down
    remove_column :victim_urls, :user_id
  end
end
