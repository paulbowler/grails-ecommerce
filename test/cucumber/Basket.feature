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
  	When I add product with ID 1 to my basket
  	Then I see 1 item in my basket
  		And my basket contains the product with ID 1, name Piano and price 499900

Scenario: add multiple items to basket
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
  			| A1000 | Piano   | A very lovely grand piano | 499900 |
  			| B2000 | Flute   | A shiny silver flute      | 199500 |
  			| C3000 | Bassoon | A mellow German bassoon   | 299900 |
  	When I add product with ID 1 to my basket
  		And I add product with ID 2 to my basket
  		And I add product with ID 3 to my basket
  	Then I see 3 items in my basket
  		And my basket contains the product with ID 1, name Piano and price 499900
  		And my basket contains the product with ID 2, name Flute and price 199500
  		And my basket contains the product with ID 3, name Bassoon and price 299900