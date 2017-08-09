# Review Board Selector

Run app with `ruby app.rb`. Test app with `bundle exec rspec`.

## Classes

* `BoardScraper` created to retrieve and parse crafter information from website.
* `BoardSelector` created to generate random numbers, pull crafters based on number list, and display names.
* `Search` created to hold search criteria.

## Backlog

* Implement error handling for get request (something is currently in place but not sure of the correctness)
* Implement error handling if `crafters_list_is_long_enough` is false
* Figure out error handling test in rspec
* Include error handling test for get request in tests
* Separate static information into object? css classes, etc.
* Make tests dryer

## To Research

* Are you using the Gemfile correctly?
* Read about `self` in Ruby.
* Realized maybe I don't know error handling very well.
