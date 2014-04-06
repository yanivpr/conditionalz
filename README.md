conditionz
===================

# Description

Semantic Design-By-Contract pre-conditions and post-conditions.

The purpose is to raise an error when a certain condition or more are not met.

See

http://en.wikipedia.org/wiki/Design_by_contract

http://en.wikipedia.org/wiki/Precondition

http://en.wikipedia.org/wiki/Postcondition


# Installation

Add to your Gemfile:

```ruby
gem 'conditionz'
```

Then run:

```ruby
bundle install
```

# Usage

Suppose you have the following class:

```ruby
class MyTime
  attr_accessor :hour, :minute

  def initialize(new_hour, new_minute)
    hour = new_hour
    minute = new_minute
  end
end
```

Now you wish that initialize method parameters are within a certain range.
Include the pre condition, and add the precondition

```ruby
include Conditionz

class MyTime
  attr_accessor :hour, :minute

  def initialize(new_hour, new_minute)
    Precondition.require 0 <= new_hour && new_hour <= 23, "Hour must be between 0 and 23"
    Precondition.require 0 <= new_minute && new_minute <= 59, "Minute must be between 0 and 59"

    hour = new_hour
    minute = new_minute
  end
end
```

Notice the call to ```Precondition.require```, which receives a predicate (a boolean expression),
and an optional message ```string``` or ```proc```.

Here's an example with proc:
```ruby
Precondition.require 0 <= new_hour && new_hour <= 23, Proc.new { "Hour must be between 0 and 23 but got #{new_hour}" }
```

Analogously, you can ensure post conditions:
(In this example, instead of ```include```, the fully qualified name is used

```ruby
class MyQueue
  attr_accessor :size

  def push(item)
    # some implementation of pushing to queue...

    Conditionz::PostCondition.ensure size > 0
  end
end
```


Not directly related, and preferably unit tested, but could be useful - assert a predicate

```ruby
def foo
  first_result = first_calculation()
  Assert.that first_result > 0, "result should have been positive"
  second_result = sqrt first_result
end
```

# License

see MIT-LICENSE