require "minitest/autorun"
require "json"
require "pry"
require_relative "./main"

class MainTest < Minitest::Test
  
  def test_compare_output_and_expected_output_level_2
    expected_output = JSON.parse(File.read("./data/expected_output.json")).to_json
    output = JsonOutput.new("./data/input.json").json_output(include_discount: true)
    assert_equal expected_output, output
  end

end