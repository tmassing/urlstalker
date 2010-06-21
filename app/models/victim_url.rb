require "mechanize"
require "rest_client"
require "gist"


class VictimUrl < ActiveRecord::Base
  # validates :name, :url, :query, :presence => true
  validates_presence_of :name, :url, :query
  # validates_uniqueness_of :name

  # before_save do |victim_url|
  #   if victim_url.gist_id.nil?
  #     gist = Gist.new(victim_url.name,victim_url.results)
  #     self.gist_id = gist.publish
  #   else
  #     gist = Gist.new(victim_url.name,victim_url.results, victim_url.gist_id)
  #     gist.publish
  #   end
  # end

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
end
