# Clone the Project
```
https://github.com/appsimpactacademy/kata-tdd.git
```

# Setup Project

You need to run the bundle install on order to get this ruby project work in your local. Because it uses rspec for test coverage.

```
bundle install
```

# Specs
This project follows the TDD practices and has specs for multiple scenarios. 

## Running all specs
```
bundle exec rspec
```

## Run spec at any specific line
```
rspec spec/string_calculator_spec.rb:10
```

# Running program

To run the program without specs you need to add following lines in it:
```ruby
calc = StringCalculator.new
result = cal.add(--PROVIDE YOUR INPUT STRING HERE--)
p result
```

And then save the `string_calculator.rb` class and run it in terminal:
```
ruby string_calculator.rb
```

Thanks
