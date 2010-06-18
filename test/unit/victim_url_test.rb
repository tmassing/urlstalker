require 'test_helper'

class VictimUrlTest < ActiveSupport::TestCase
  context "A Victim Url" do
    should validate_presence_of :url
    should validate_presence_of :name
    should validate_presence_of :query
  end
end
