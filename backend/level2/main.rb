require_relative "../getaround/json_service/json_output"

output_json = JsonOutput.new("./data/input.json").json_output(include_discount: true)

json_file_path = "data/output.json"

File.open(json_file_path, "w") do |file|
  file.puts(output_json)
end