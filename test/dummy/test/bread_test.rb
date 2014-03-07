puts File.expand_path("..",  __FILE__).to_s
require 'test_helper'

class BreadTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Bread
  end
end
