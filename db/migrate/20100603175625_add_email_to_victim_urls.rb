class AddEmailToVictimUrls < ActiveRecord::Migration
  def self.up
    add_column :victim_urls, :email, :string
  end

  def self.down
    remove_column :victim_urls, :email
  end
end
