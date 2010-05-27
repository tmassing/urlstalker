require 'test_helper'

class VictimUrlTest < ActiveSupport::TestCase
  context "test" do
    should "be valid" do
      assert VictimUrl.new.valid?
    end
  end
end
