WhowishWord - a Rails gem that make static content editable
====================

WhowishWord makes static content editable, as long as the programmers follow its convention.

Demo: http://whowish-word.heroku.com


The problem WhowishWord tries to solve
---------------------------------------

The problem that I personally faced in my company, Whowish, is that:

	Occasionally CEO or VP of Marketing would send me an email to change the word 'Save'(on a submit button) to the word 'Post'.
	I would have to go to the source code and change it.
	And when this happens too often, it drives us, the programmers, crazy

WhowishWord tries to solve this problem elegantly. It is much better than using a config file.

It gives a simple tool for CEO, VP of Marketing (or whoever it is) to make changes themselves.

The beauty of WhowishWord is that:

* It is almost transparent to programmers
* Programmers don't have to care how wording should be. This makes them work much faster
* It does not clutter up your source code because you replace one static content unit with one function call

Demo: http://whowish-word.heroku.com


How you should work
-------------------

In your view, e.g. index.html.erb, use t(:identifier) and ta(:identifier):

```erb
<h1><%=t :title%></h1>
<h3><%=t :you_are_here_for_number_of_times, :number=> 10 %></h3>

<b><%=t :name_label%><b> <%=t :my_name%><br/>

<b><%=t :your_name_label%></b> 
<input type="text" placeholder="<%=ta :your_name_here%>"><br/>
<a href="#" title="<%=ta :your_name_will_be_kept_secret%>">?</a>

<button><%=ta :submit_button%></button>
```

Now when you want to edit wording:

1. Activate edit mode by calling:
```
whowish_word.activate_edit_mode
```
 in any controller. 
 (The usual way is to use user's session to determine whether or not to activate WhowishWord's edit mode)

2. You'll see an edit icon on each word
3. Click on an edit icon to edit the corresponding word
4. Fill in a new word, and click save

And when you have finished, deactivate edit mode.

WhowishWord empowers normal users (project manager, marketing department, or sales) to change wording on a website.
This take the burden off programmers because it is extremely boring to change wording...

Demo: http://whowish-word.heroku.com

### Note

WhowishWord supports variables:

```erb
<%=t :you_are_here_for_number_of_times, :number=> 10 %>
```

If you set the word :you_are_here_for_number_of_times to be 

```
You are here %{number} times already
```

WhowishWord renders it as:

```
You are here 10 times already
```

Multi-language support
-----------------------

You can change locale of WhowishWord by:

```ruby
I18n.locale = :en
```

In Rails, you should add before_filter in the application controller as shown below:

```ruby
before_filter :set_locale

def set_locale
  if params[:locale]
    session[:locale] = params[:locale]
  end

  session[:locale] ||= "en"
  I18n.locale = session[:locale].to_sym
end
```


Prerequisite
-------------------

Rails 3.2.3

It does not work with Rails 3.0.*, yet. Please send me an issue and I will fix it. (I'm just lazy)



How to use it
-------------------

1. Install it:
```
gem install whowish_word
```

Or, in your Gemfile, put in the below line:
```
gem 'whowish_word'
```

2. Create ```RAILS_ROOT/config/initializers/whowish_word.rb``` that contains:

```ruby
require 'whowish_word'

WhowishWord.init()

```

And, in your layout, please drop this line inside the tag header:

```erb
<%= whowish_word_javascript_and_css%>
```

It is to include the required Javascript and css files, when the edit mode is activated.

3. When deploying, please create a folder ```RAILS_ROOT/config/locales/whowish_word``` and make it a shared path.

All edited words will be generated in this folder.

Please also make the folder writable.



Help me
-------------------------------------------------

1. Fork the project
	* Run all tests first:
		* Go to ROOT/rails, type
		```
			bundle exec rspec spec/*
		```
		* If all tests pass, you are ready to add a feature
2. Add a feature
3. Write a test for it
4. Send me a pull request

Please learn the code structure. If you have any question, feel free to ask me.


Authors
-------------------

Tanin Na Nakorn

Tanun Niyomjit (Designer)


Boring legal stuff
-----------------------

WhowishWord relies on several libraries that you won't see.
They are embedded into whowish_word.js.

The libraries:

* jQuery 1.6.4 http://jquery.com/
* Class.js (John Resig) http://ejohn.org/blog/simple-javascript-inheritance/
* jQuery.escape http://plugins.jquery.com/project/escape
* JSizes http://www.bramstein.com/projects/jsizes/
* jQuery.loading_button (This is mine)

Please be aware of the licenses of other libraries.

For WhowishWord's code itself, it is under this license: http://creativecommons.org/licenses/by/3.0/

Basically, you can do whatever you want with it. Just give us some credits.