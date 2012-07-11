Feature: manage basket
    As a customer
    I want to add products to my basket
    so that I can order multiple products in one transaction

Scenario: empty basket
   Given I have an empty basket
    When I view my basket
    Then I see 0 items in my basket
    
Scenario: add multiple items to basket
	Given I have an empty basket
		And the following items are available:
  			| sku   | name    | description               | price  |
			| A1000 | Piano   | A very lovely grand piano | 499900 |
  			| B2000 | Flute   | A shiny silver flute      | 199500 |
  			| C3000 | Bassoon | A mellow German bassoon   | 299900 |
  	When I add product with ID 1 to my basket
  	Then my basket contains the product with ID 1