Feature: manage basket
    As a customer
    I want to add products to (and manage products in) my basket
    so that I can order multiple products in one transaction

Background: set up the products and empty basket
	Given I have an empty basket
		And the following items are available for purchase:
  			| sku   | name    | description               | price  |
  			| A1000 | Piano   | A very lovely grand piano | 500000 |
  			| B2000 | Flute   | A shiny silver flute      | 200000 |
  			| C3000 | Bassoon | A mellow German bassoon   | 300000 |
  			| D4000 | Trumpet | A golden French trumpet   | 400000 |

Scenario: empty basket
	When I view my basket
	Then I see 0 items in my basket
    
Scenario: add single item to basket
  	When I add product with SKU A1000 to my basket
  		And I view my basket
  	Then the flash message reads "The item has been added to your basket."
  		And I see 1 item in my basket
  		And my basket contains 1 Piano with SKU A1000 costing 500000 units

Scenario: add duplicate item to basket
  	When I add product with SKU A1000 to my basket
  		And I add product with SKU A1000 to my basket
  		And I view my basket
  	Then the flash message reads "This product is already in your basket."
  		And I see 1 item in my basket
  		And my basket contains 1 Piano with SKU A1000 costing 500000 units

Scenario: add multiple items to basket
  	When I add product with SKU B2000 to my basket
  		And I add product with SKU C3000 to my basket
  		And I add product with SKU D4000 to my basket
  		And I view my basket
  	Then the flash message reads "The item has been added to your basket."
  		And I see 3 items in my basket
  		And my basket contains 1 Flute with SKU B2000 costing 200000 units
  		And my basket contains 1 Bassoon with SKU C3000 costing 300000 units
  		And my basket contains 1 Trumpet with SKU D4000 costing 400000 units

Scenario: increase single item quantity
  	When I add product with SKU A1000 to my basket
  		And I update the quantity of product with SKU A1000 to 2
  		And I view my basket
  	Then the flash message reads "Basket has been updated."
  		And I see 1 item in my basket
		And my basket contains 2 Piano with SKU A1000 costing 1000000 units

Scenario: decrease single item quantity to zero
  	When I add product with SKU A1000 to my basket
  		And I update the quantity of product with SKU A1000 to 0
  		And I view my basket
  	Then the flash message reads "Basket has been updated."
  		And I see 0 items in my basket

Scenario: decrease multiple item quantity to zero
  	When I add product with SKU A1000 to my basket
  		And I add product with SKU B2000 to my basket
  		And I update the quantity of product with SKU A1000 to 0
  		And I update the quantity of product with SKU B2000 to 0
  		And I view my basket
  	Then the flash message reads "Basket has been updated."
  		And I see 0 items in my basket