require "./rental_price"

output_json = RentalPrice.new("./data/input.json").json_output 

json_file_path = "data/output.json"

File.open(json_file_path, "w") do |file|
  file.puts(output_json)
end

