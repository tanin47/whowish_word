Current issues
==================

Should we support Facebook and E-mail?
----------------------------------------


A way to activate edit mode
-------------------------------------------------

It should be activate-able inside Rails application, e.g. a call to WhowishWord.activate_edit_mode.
We let user manage its own session.

The thing to look out is that we have to be careful about using a global variable within WhowishWord gem
because it is shared among users....

### Solution

Create a single point of activating an edit mode, WhowishWord.activate_edit_mode()



Support different database engine
-------------------------------------------------

It is painful to use WhowishWord on different database (MySQL, PostgreSQL, MongoDB, Redis, ...).

Here is a cycle for a database

- Initialize structure
- Save migration version
- Rails uses it
- Do another migration
- Save the new version 

There must be a better way that:
- lets user configure easily
- does not depend on 3rd library (No ORM. Really? Should we do that?)
	- ActiveRecord is ok
	- Mongoid is not, because it is not a standard
- 

### Solution


### (Not good) Solution

Use SQLite instead.
However, this poses another problem. SQLite cannot be run on Cloud service, e.g. Heroku.



Javascript text issue
----------------------

Javascript text being enclosed with single-quotes causes an error 
(Even if we'd change to double-quotes enclosing, there would still be a problem)


### Solution 1

Offer 2 modes: single-quote enclosing and double-quote enclosing
This is because there is no way to know whether the whowish word is enclosed with which type of quote.

### Solution 2

Escape a single-quote to &#39;
Escape a double-quote to &quot;


Input text attributes (Solved!)
----------------------

In edit mode, we cannot add edit icon next to the element, which owns the attribute.

### Solution

Use javascript to add the edit icon.

1. Generate a unique text in the attribute
2. Get the element by searching for the unique text
3. Replace text with a whowish word
4. Add edit icon to the element

When getting an element, we have to store the element and the attribute's name in a hash for future use.
This is because the element might not have its own ID.


Select box options (Solved!)
---------------------

In edit mode, we cannot edit whowish word in option's value and option's text

### Solution

Use javascript to generate edit icon


