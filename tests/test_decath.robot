*** Settings ***
Documentation    Test case to search for "bonnet" on Decathlon and add the first item to the cart.
Resource         ../resources/keywords/keywords_decath.robot
Resource         ../resources/keywords/keywords_common.robot

*** Test Cases ***
Scenario: Search and add a product to cart
    [Documentation]    This test searches for a product on Decathlon website and adds the first bonnet to the cart.
    Given I Search For "Product A" On Decathlon Website
    When I Add The First Corresponding Item To The Cart
    Then I Should Be Able To See The "Product A" In The Cart
