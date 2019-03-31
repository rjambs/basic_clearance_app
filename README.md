# Take Home Project

This is my submission for the take home project for First Circle.

## How to run

```
rbenv install 2.3.4
rbenv local 2.3.4
rbenv rehash

rake db:reset # or bundle exec rake db:reset
rails s
```

## What's new in 2.0?

#### Models
- `StyleType` - a model that captures the general style types (i.e. Dress, Pants). This model also contains the _minimum_price_ by which a general style should be sold (i.e Dresses cannot be sold for less than 5 USD)
- `Style` - a model that captures the specific styles (i.e Sunday Dress, Jogging Pants)
- `Items` - I added state_machine to manage the status of items. 

#### Backend
- I totally rebuild the backend to be organized in small, independent, testable units.
- For this rebuild, I used the following gems:
    - `interactor` - this gem helps me setup simple, single-purpose objects which I can use to create the small, independent, testable units of the rebuilt application. The interactor gems comes with methods such as _success?_,  _failure?_, _fail!_, and _errors_. This helps me create a more consistent interface to each unit of the application.
    - `interactor-contracts` - Ensuring the interactor has A, B, C variables (of type String, Int and Item) for input and D variables (of type Array) for output can be a pain point when working with the interactor gem. With interactor_contracts, I get to be able to define the input and output required (and what data type) with a simple DSL provided by the gem.
    - `state_machine` - This gem makes coding state transitions, and state transition rules a breeze with its easy-to-use interface.
    - `factory-bot` - A better version of factory-girl
- The interactor units for batch clearing are arranged in this way
    - `ClearanceBatches::Operations::ClearBatch`
        - `ClearanceBatches::ReadCsv` - Get the file containing the item_ids of the items for clearing, validate each one, and return a list of items ready for clearance.
            - `Items::Validate` - This validates an item_id if it is valid (it is an non-zero integer), exists (represents a record in DB), sellable (the item is state = sellable)
        - `ClearanceBatches::Execute` - Get the list of items and clear them.
            - `Items::Operations::ClearItem.call(item: item)` - The list of items is looped through, with each item sent to this organizer.
                - `Items::ComputeClearancePrice` - This computes the price the item will be cleared for
                - `Items::ExecuteClearanceSale` - This clears the item and writes the price_sold to the database
#### Conventions
- Working with both a legacy project and a newly released project in my current company, I learned the importance of setting code conventions with the team and enforcing that tightly through code reviews. For my rebuild, I set the following conventions:
    - `app/interactors/<model>` - the interactor units will be organized in model folders. This makes it easier to find interactors for reuse for similar but not same operations (i.e clear special items)
    - `app/interactors/<model>/operations` - the operations folder will contain the organizers or units that are connected to the controller directly. 
#### Frontend
- I migrated all views to HAML to make it easier to write to.
- I added a second view (/clearance_batches/3) that shows a report of the clearance batch. 
    - To provide a better UI, I provided the f.f:
        - The report DOES NOT show every item sold under the clearance batch. That would be too much and too unnecessary. 
        - The report DOES group each item sold by style
        - The report shows the price_sold, wholesale_price, and the revenue. These are the things a typical business/operations person want to see.
        - Provided total revenue and total item count for the batch.
        - Provided Navs to go back to the index page.