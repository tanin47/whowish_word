WhowishWord (This is a draft)
====================

Have you ever been bored when a project manager (or marketing department) keeps changing wording on a website?

WhowishWord facilitates the process of changing wording on a website.


How you should work
-------------------

1. Activate edit mode by calling:
```
activate_whowish_word_edit_mode() 
```
in any controller. (The usual way is to use user's session to determine whether or not to activate WhowishWord)

2. You'll see an edit icon on each word
3. Click on an edit icon to edit the corresponding word
4. Fill in a new word, and click save
	* If it is the first time, you will need to fill master password at this point. (The instruction how to set password is below)

And when you have finished, deactivate edit mode.

WhowishWord empowers normal users (project manager, marketing department, or sales) to change wording on a website.
This take the burden off programmers because it is extremely boring to change wording...


Prerequisite
-------------------

Rails 3.1.*

It does not work with Rails 3.0.*, yet. Please send me an issue and I will fix it. (I'm just lazy)



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

WhowishWord.init(:active_record)

WhowishWord.username = "root"
WhowishWord.password = "pass"
```

You can use either use :active_record or :mongoid

And, in your layout, please drop this line inside the tag header:

```erb
<%= whowish_word_javascript_and_css%>
```

It is to include the required Javascript and css files, when the edit mode is activated.


Performance
-------------------

It is fast because words are kept in memory. They are not kept in database while your Rails is running.


How to extend WhowishWord to suit your need
-------------------------------------------------

WhowishWord is nicely structure. You can extend it by writing a new handler and creator (on client-side).

Please learn the code structure. If you have any question, feel free to ask me.


Authors
-------------------

Tanin Na Nakorn

Tanun Niyomjit (Designer)


Boring license stuffs
-----------------------

WhowishWord relies on jQuery 1.6.4. It is embedded into whowish_word.js, so you won't see it.

It also relies on other libraries as well:

* Class.js - John Resig http://ejohn.org/blog/simple-javascript-inheritance/
* jQuery.escape http://plugins.jquery.com/project/escape
* JSizes http://www.bramstein.com/projects/jsizes/
* jQuery.loading_button (This is mine)

Please be aware of the licenses of other libraries.

For WhowishWord's code itself, it is under this license: http://creativecommons.org/licenses/by/3.0/

Basically, you can do whatever you want with it. Just give us some credits.