# Getaround Backend Challenge 

This challenge has been solved for Getaround job application. Please refer to [Getaround EU Backend Challenge (previously Drivy)](https://github.com/drivy/jobs/tree/master/backend) for more informations on the challenge

### Requirements before reviewing the code 
- run `gem install json` to load the JSON file 
- run `gem install minitest` to run test

### Guidelines

For each level, to generate the `output.json` file, run `ruby main.rb` inside the level folder

### Test (Minitest)

in each level folder, you may run the test `ruby main_test.rb`. The test ensure that the output equal the `expected_output.json`

### Code explanation

Inside the `getaround/json_service` directory, the `json_input.rb` receives the `data/input.json` file from each level. The `json_output.rb` will generate the `output.json` in each `data` folder of each level.

As stated in the "Guidelines" above, an instance of `JsonOutput` is created in each `main.rb` 




