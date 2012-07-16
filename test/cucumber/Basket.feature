Feature: manage basket
    As a customer
    I want to add products to (and manage products in) my basket
    so that I can order multiple products in one transaction

Background: set up the products and empty basket
	Given I have an empty basket
		And the following items are available for purchase:
  			| sku   | name    | description               | price  |
  			| A1000 | Piano   | A very lovely grand piano | 499900 |
  			| B2000 | Flute   | A shiny silver flute      | 199500 |
  			| C3000 | Bassoon | A mellow German bassoon   | 299900 |
  			| D4000 | Trumpet | A golden French trumpet   | 159900 |

Scenario: empty basket
	When I view my basket
	Then I see 0 items in my basket
    
Scenario: add single item to basket
  	When I add product with SKU A1000 to my basket
  		And I view my basket
  	Then the flash message reads "The item has been added to your basket."
  		And I see 1 item in my basket
  		And my basket contains the product with SKU A1000, name Piano, price 499900 and quantity 1

Scenario: add duplicate item to basket
  	When I add product with SKU A1000 to my basket
  		And I add product with SKU A1000 to my basket
  		And I view my basket
  	Then the flash message reads "This product is already in your basket."
  		And I see 1 item in my basket
  		And my basket contains the product with SKU A1000, name Piano, price 499900 and quantity 1

Scenario: add multiple items to basket
  	When I add product with SKU B2000 to my basket
  		And I add product with SKU C3000 to my basket
  		And I add product with SKU D4000 to my basket
  		And I view my basket
  	Then the flash message reads "The item has been added to your basket."
  		And I see 3 items in my basket
  		And my basket contains the product with SKU B2000, name Flute, price 199500 and quantity 1
  		And my basket contains the product with SKU C3000, name Bassoon, price 299900 and quantity 1
  		And my basket contains the product with SKU D4000, name Trumpet, price 159900 and quantity 1

Scenario: increase single item quantity
  	When I add product with SKU A1000 to my basket
  		And I update the quantity of product with SKU A1000 to 2
  		And I view my basket
  	Then the flash message reads "Basket has been updated."
  		And I see 1 item in my basket
  		And my basket contains the product with SKU A1000, name Piano, price 499900 and quantity 2

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