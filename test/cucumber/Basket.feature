Feature: manager basket
    As a customer
    I want to add products to my basket
    so that I can order multiple products in one transaction

Scenario: empty basket
   Given I have zero items in my basket
    When I view my basket
    Then I see zero items in my basket