Feature: manage basket
    As a customer
    I want to add products to my basket
    so that I can order multiple products in one transaction

Scenario: empty basket
   Given I have an empty basket
    When I view my basket
    Then I see 0 items in my basket