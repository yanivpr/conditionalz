conditionz
===================

Semantic Design-By-Contract pre-conditions and post-conditions

See
http://en.wikipedia.org/wiki/Design_by_contract

http://en.wikipedia.org/wiki/Precondition

http://en.wikipedia.org/wiki/Postcondition


# Installation

In your gemfile, add:

gem 'conditionz'

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

Include the pre condition, and add the precondition

```ruby
include Conditionz::Precondition

class MyTime
  attr_accessor :hour, :minute

  def initialize(new_hour, new_minute)
    Conditionz::Precondition.require 0 <= new_hour && new_hour <= 23, "Hour must be between 0 and 23"
    Conditionz::Precondition.require 0 <= new_minute && new_minute <= 59, "Minute must be between 0 and 59"

    hour = new_hour
    minute = new_minute
  end
end
```


