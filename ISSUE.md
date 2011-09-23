Current issues
==================

Javascript text issue
----------------------

Javascript text being enclosed with single-quotes causes an error 
(Even if we'd change to double-quotes enclosing, there would still be a problem)


### Solution

Offer 2 modes: single-quote enclosing and double-quote enclosing
This is because there is no way to know whether the whowish word is enclosed with which type of quote.


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


