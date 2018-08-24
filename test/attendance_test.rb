require "test_helper"

class AttendanceTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Attendance::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end
