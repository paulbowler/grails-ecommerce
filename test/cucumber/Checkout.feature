Feature: checkout basket
    As a customer
    I want to checkout my basket
    so that my order can be processed and delivered to me

Scenario: empty basket
	Given I have an empty basket
	When I checkout my basket
	Then I see the emptyBasket page