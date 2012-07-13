Feature: manage basket
    As a customer
    I want to add products to and manage products in my basket
    so that I can order multiple products in one transaction

Scenario: empty basket
   Given I have an empty basket
    When I view my basket
    Then I see 0 items in my basket
    
Scenario: add single item to basket
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
			| A1000 | Piano   | A very lovely grand piano | 499900 |
  	When I add product with SKU A1000 to my basket
  	Then I see 1 item in my basket
  		And my basket contains the product with SKU A1000, name Piano, price 499900 and quantity 1

@ignore
Scenario: add multiple items to basket
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
  			| B2000 | Flute   | A shiny silver flute      | 199500 |
  			| C3000 | Bassoon | A mellow German bassoon   | 299900 |
  			| D4000 | Trumpet | A golden French trumpet   | 159900 |
  	When I add product with SKU B2000 to my basket
  		And I add product with SKU C3000 to my basket
  		And I add product with SKU D4000 to my basket
  	Then I see 3 items in my basket
  		And my basket contains the product with SKU B2000, name Flute, price 199500 and quantity 1
  		And my basket contains the product with SKU C3000, name Bassoon, price 299900 and quantity 1
  		And my basket contains the product with SKU D4000, name Trumpet, price 159900 and quantity 1

@ignore
Scenario: increase single item quantity
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
			| A1000 | Piano   | A very lovely grand piano | 499900 |
  	When I add product with SKU A1000 to my basket
  		And I update the quantity of product with SKU A1000 to 2
  	Then I see 1 item in my basket
  		And my basket contains the product with SKU A1000, name Piano, price 499900 and quantity 2

@ignore
Scenario: decrease single item quantity to zero
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
			| A1000 | Piano   | A very lovely grand piano | 499900 |
  	When I add product with SKU A1000 to my basket
  		And I update the quantity of product with SKU A1000 to 0
  	Then I see 0 items in my basket

@ignore
Scenario: decrease multiple item quantity to zero
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
			| A1000 | Piano   | A very lovely grand piano | 499900 |
			| B2000 | Flute   | A shiny silver flute      | 199500 |
  	When I add product with SKU A1000 to my basket
  		And I add product with SKU B2000 to my basket
  		And I update the quantity of product with SKU A1000 to 0
  		And I update the quantity of product with SKU B2000 to 0
  	Then I see 0 items in my basket