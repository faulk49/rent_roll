require 'test_helper'

class ResidentTest < ActiveSupport::TestCase
  test "should not save resident without name" do
    resident = Resident.new
    assert_not resident.save, "Saved the resident without a name"
  end
end
