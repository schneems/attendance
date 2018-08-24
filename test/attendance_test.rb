require 'test_helper'

class Attendance::Test < ActiveSupport::TestCase
  setup do
    u = User.where(name: "schneems").first_or_create
    assert_equal true, u.save
  end

  test "monkey patches present?" do
    user = User.where(name: "schneems", email: nil)
    assert_equal true,  user.present?
    assert_equal false, !!user.loaded?
  end
end
