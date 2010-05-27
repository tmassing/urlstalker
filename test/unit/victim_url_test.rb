require 'test_helper'

class VictimUrlTest < ActiveSupport::TestCase
  should "be valid" do
    assert VictimUrl.new.valid?
  end
end
