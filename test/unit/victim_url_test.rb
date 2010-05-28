require 'test_helper'

class VictimUrlTest < ActiveSupport::TestCase
  context "A Victim Url" do
    # setup do
    #   @victim_url = VictimUrl.find(:first)
    # end
    should_validate_presence_of :url, :name, :query
    should_validate_uniqueness_of :name
  end


end
