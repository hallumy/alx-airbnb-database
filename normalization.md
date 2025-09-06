The database fo the airbnb project is in 3NF:

** It satisfies the 1NF:
    - Each column contains atomic values
    - No repeating groups or arrays
    - Every row must be unique

** It satisfies the 2NF:
    - The 1NF must be satisfies
    - All non-key attributes must primarily depend on a primary key
    - Applies when you have composite primary keys

** It satisfies the 3NF:
    - Must already bein 2NF
    - No transitive dependencies:
         - Non-key attributes must depend only on the pimary key, not on othe non-key attributes.
