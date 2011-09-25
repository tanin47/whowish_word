WhowishWord
====================

Have you ever been bored when a project manager (or marketing department) keeps changing wording on a website?

WhowishWord facilitates the process of changing wording on a website.


How you should work
-------------------

1. Activate edit mode through http://your_domain/whowish_word
2. Go back to the website, you'll see an edit icon on each word
3. Click on an edit icon to edit the corresponding word
4. Fill in a new word, and click save

And when you have finished, deactivate edit mode.

WhowishWord empowers normal users (project manager, marketing department, or sales) to change wording on a website.
This take the burden off programmers because it is extremely boring to change wording...


Prerequisite
-------------------

Rails 3.0.*

(Haven't tested with Rails 3.1.*)


How to use it
-------------------

First, install it:
```
gem install whowish_word
```

Or, in your Gemfile, put in the below line:
```
gem 'whowish_word'
```

Second, create RAILS_ROOT/config/initializers/whowish_word.rb that contains:

```ruby
require 'whowish_word'

WhowishWord.database_engine = :mysql
```

You can use either use :mysql or :mongodb
(I have planned to add :redis and :postgresql)

Performance
-------------------

It is fast because words are kept in memory. They are not kept in database while your Rails is running.


How to extend WhowishWord to suit your need
-------------------------------------------------

WhowishWord is nicely structure. You can extend it by writing a new handler and creator (on client-side) and a new generator (on server-side).

Please learn the code structure. If you have any question, feel free to ask me.


Author
-------------------

Tanin Na Nakorn
