require_relative "../getaround/json_service/json_output"

HASHES_TO_PASS = [
  :action
]

output_json = JsonOutput.new("./data/input.json").json_output(HASHES_TO_PASS, include_discount: true, include_action: true)

json_file_path = "data/output.json"

File.open(json_file_path, "w") do |file|
  file.puts(output_json)
end