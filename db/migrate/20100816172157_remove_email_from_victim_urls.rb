class RemoveEmailFromVictimUrls < ActiveRecord::Migration
  def self.up
    remove_column :victim_urls, :email
  end

  def self.down
    add_column :victim_urls, :email, :string
  end
end
