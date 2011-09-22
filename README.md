whowish_word
====================

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
```
gem install whowish_word
```

Or, in your Gemfile, put in the below line:
```
gem 'whowish_word'
```

Second, create RAILS_ROOT/config/initializers/whowish_word.rb that contains:

```
require 'whowish_word'

WhowishWord.database_engine = :mysql
```

You can use either use :mysql or :mongodb
(I have planned to add :redis and :postgresql)

Performance
-------------------

It is fast because words are kept in memory. They are not kept in database while your Rails is running.


How to extend whowish_word to suit your need
-------------------------------------------------

Sometimes whowish_word needs to render words in different form in order to suit unique needs. 


### Example 1

```
<input type="text" placeholder="<%=word_for :default_text%>" value="<%=word_for :default_value%>">
```

When activating edit mode, we should be able to edit default_text and default_value.


### Example 2

```
alert("<%=word_for :alert_word%>")
```

When activating edit mode, we should be able to edit alert_word.


Author
-------------------

Tanin Na Nakorn
