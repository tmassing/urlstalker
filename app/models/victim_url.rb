require "mechanize"
require "rest_client"
require "gist"


class VictimUrl < ActiveRecord::Base
  # validates :name, :url, :query, :presence => true
  validates_presence_of :name, :url, :query
  belongs_to :user
  # validates_uniqueness_of :name
  before_save :publish_gist


  def results
    agent = Mechanize.new{ |a|
      a.user_agent_alias = 'Mac Safari'
    }
    agent.get(url)
    ary = agent.page.search(query)
    ary = ary.map do |e|
        e.to_s
    end
    ary.join("\n")
  end

  def check_for_updates
    self.publish_gist
    if File.exist?("tmp/gists/#{self.gist_id}")
      g = Git.open("tmp/gists/#{self.gist_id}")
      g.remote("origin").fetch
      g.remote("origin").merge
    else
      g = Git.clone("git://gist.github.com/#{self.gist_id}.git","tmp/gists/#{self.gist_id}")
    end
    if self.git_sha.nil?
      self.git_sha = g.object('HEAD').sha
      self.save
    elsif self.git_sha != g.object('HEAD').sha
      logger.info "Updated SHA...something has changed"
      self.git_sha = g.object('HEAD').sha
      self.save
    end
  end


  protected

  def publish_gist
    if gist_id.nil?
      gist = Gist.new(name,results)
      self.gist_id = gist.publish
    else
      gist = Gist.new(name,results, gist_id)
      gist.publish
    end
  end
end
