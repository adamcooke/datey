# Datey

Datey is a relatively simple library to allow you to interrogate Ruby Date/Time objects in a nice manner to determine where the date appears in relation to today.

## Installation

Just add this to your Gemfile and run `bundle` to install it.

```ruby
gem "datey", "~> 1.0"
```

## Usage

### Formatting

The formatter in Datey is designed to spit out a friendly looking date with some awareness of the current time. For example, the following are all styles of date which will be produced:

* Today
* Yesterday
* Tomorrow
* Last Wednesday
* Next Friday
* 23rd February
* 14th November 2013

These can then be combined with the time too, if needed. When you include the time, it will either be outputted as `3pm` or `3:30pm`. If there are no minutes, it will simply not display them at all.

When creating the formatter, you should include an appropriate context as either `:future` or `:past`. The value you use here will depend on the page in which you are displaying these dates. For example, if you're displaying an activity feed you'd want to use `past` whereas if you're displaying a list of upcoming events, you might use `:future`.

```ruby
date      = Time.new(2014, 10, 15, 3, 45)
formatter = Datey::Formatter.new(date, :future)
formatter.date            #=> "Today"
formatter.time            #=> "3:45am"
formatter.date_and_time   #=> "Today at 3:45am"
```

### Interrogating

The formatter makes use an Interrogator which looks at a given date and returns true or false values depending on "questions" you ask. As follows:

```ruby
date          = Date.new(2014, 10, 16)
interrogator  = Datey::Interrogator.new(date)

# Once you have set up an interrogation instance, you can use any of the 
# following methods which will all return true or false.
interrogator.today?
interrogator.yesterday?
interrogator.tomorrow?
interrogator.last_week?         #=> Date occurs on any day in the week preceding the current week
interrogator.last_x_days?(7)    #=> Date occurs in the last X days 
interrogator.next_x_days?(7)    #=> Date occurs in the next X days
interrogator.this_week?         #=> Date occurs in the current week (Sun -> Sat)
interrogator.next_week?         #=> Date occurs in the week following the current week
interrogator.past?
interrogator.future?
```

## Tests

This library is sorely in need of a test suite. I will probably get around to adding one but if any fancying contributing, please do :)
