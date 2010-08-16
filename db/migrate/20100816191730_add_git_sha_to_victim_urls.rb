class AddGitShaToVictimUrls < ActiveRecord::Migration
  def self.up
    add_column :victim_urls, :git_sha, :string
  end

  def self.down
    remove_column :victim_urls, :git_sha
  end
end
