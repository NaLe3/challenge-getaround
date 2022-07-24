require "minitest/autorun"
require "json"
require "./main"
require "pry"

class MainTest < Minitest::Test

  def test_compare_output_and_expected_output
    expected_output = JSON.parse(File.read("./data/expected_output.json")).to_json
    output = RentalPrice.new("./data/input.json").json_output
    assert_equal expected_output, output
  end

end