require "minitest/autorun"
require "json"
require "pry"
require_relative "./main"

class MainTest < Minitest::Test

  HASHES_TO_PASS = [
    :price
  ]
  
  def test_compare_output_and_expected_output_level_1
    expected_output = JSON.parse(File.read("./data/expected_output.json")).to_json
    output = JsonOutput.new("./data/input.json").json_output(HASHES_TO_PASS)
    assert_equal expected_output, output
  end

end