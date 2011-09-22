whowish_word
===================

whowish_word facilitates the process of changing words on a website.


How you should work
-------------------

1. Activate edit mode through http://your_domain/whowish_word
2. Go back to the website, you'll see an edit icon on each word
3. Click on an edit icon to edit the corresponding word
4. Fill in a new word, and click save

And when you have finished, deactivate edit mode

Prerequisite
-------------------

Rails 3.0
jQuery


How to use it
-------------------

First, install it:
```bash
gem install whowish_word
```

Or, in your Gemfile, put in the below line:
```Gemfile
gem 'whowish_word'
```

Second, create <Rails's root>/config/initializers/whowish_word.rb that contains:
```ruby
require 'whowish_word'

WhowishWord.database_engine = :mysql
```

* You can use either use :mysql or :mongodb
(I have planned to add :redis and :postgresql)

Performance
-------------------

It is fast because words are kept in memory. They are not kept in database while your Rails is running.


Authors
-------------------

Tanin Na Nakorn
