require "mechanize"
require "rest_client"
require "gist"


class VictimUrl < ActiveRecord::Base
  # validates :name, :url, :query, :presence => true
  validates_presence_of :name, :url, :query
  # validates_uniqueness_of :name
  before_save :publish_gist


  def results
    agent = Mechanize.new{ |a|
      a.user_agent_alias = 'Mac Safari'
    }
    agent.get(url)
    ary = agent.page.search(query)
    ary = ary.map do |e|
      if content_only?
        e.content
      else
        e.to_s
      end
    end
    ary.join("\n")
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
