*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
Log Out
    [Documentation]    Log out from Sauce Demo
    Click Button    locator=//*[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    locator=//*[@id="logout_sidebar_link"]
    Click Element    locator=//*[@id="logout_sidebar_link"]
    Wait Until Page Contains Element    locator=//*[@id="login-button"]

Verify Error Message
    [Documentation]    Verify the lock out user cannot connect
    Wait Until Page Contains    text=Sorry, this user has been locked out.

Sort Products By Price
    [Documentation]    This test verifies the user can sort the products by price
    Wait Until Page Contains Element    locator=//select[@class='product_sort_container']
    Select From List By Value    //select[@class='product_sort_container']    hilo
    Wait Until Page Contains    text=Price (low to high)

Add Two Most Expensive Products To Cart
    [Documentation]    This test verifies the user can add the two most expensive products to the cart
    Wait Until Page Contains Element    locator=//*[@id="inventory_container"]/div/div[1]/div[2]
    Wait Until Element Contains    //*[@id="inventory_container"]/div/div[1]/div[2]    $49.99
    # Wait Until Page Contains Element   //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Button    locator=//*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Wait Until Page Contains Element    locator=//*[@id="remove-sauce-labs-fleece-jacket"]
    Wait Until Page Contains Element    locator=//*[@id="inventory_container"]/div/div[2]/div[2]
    Wait Until Element Contains    //*[@id="inventory_container"]/div/div[2]/div[2]    $29.99
    Click Button    locator=//*[@id="add-to-cart-sauce-labs-backpack"]
    Wait Until Page Contains Element    locator=//*[@id="remove-sauce-labs-backpack"]
    # Wait Until Page Contains Element    locator=//*[@id="shopping_cart_container"]/a/span
    Wait Until Element Contains    //*[@id="shopping_cart_container"]/a/span    2

Go To Cart And Verify Products
    [Documentation]    This test verifies the user can go to the cart and verify the products
    Click Element    locator=//*[@id="shopping_cart_container"]/a
    Wait Until Page Contains  text=Your Cart
    Wait Until Page Contains Element    locator=//*[@id="cart_contents_container"]/div/div[1]/div[3]
    Wait Until Element Contains    //*[@id="cart_contents_container"]/div/div[1]/div[3]    $49.99
    Wait Until Page Contains Element    locator=//*[@id="cart_contents_container"]/div/div[1]/div[4]
    Wait Until Element Contains    //*[@id="cart_contents_container"]/div/div[1]/div[4]    $29.99

Enter Customer Information And Verify Prices
    [Documentation]    This test verifies the user can enter customer information and verify the prices
    Click Button    locator=//*[@id="checkout"]
    Wait Until Page Contains    text=Checkout: Your Information
    Input Text    locator=//*[@id="first-name"]    text=Damien
    Input Text    locator=//*[@id="last-name"]    text=Automatisation
    Input Text    locator=//*[@id="postal-code"]    text=75000
    Click Button    locator=//*[@id="continue"]
    Wait Until Page Contains    text=Checkout: Overview
    Wait Until Page Contains    text=Sauce Labs Fleece Jacket
    Wait Until Page Contains    text=Sauce Labs Backpack
    Wait Until Page Contains Element    locator=//*[@id="checkout_summary_container"]/div/div[1]/div[3]
    Wait Until Element Contains    //*[@id="checkout_summary_container"]/div/div[1]/div[3]    $49.99
    Wait Until Page Contains   text=$29.99
    Wait Until Page Contains   text=Item total: $79.98

Complete The Order
    [Documentation]    This test verifies the user can complete the order
    Click Button    locator=//*[@id="finish"]
    Wait Until Page Contains    text=Checkout: Complete!
    Wait Until Page Contains    text=Thank you for your order!

Verify Order Completion
    [Documentation]    Verify the order completion
    Wait Until Page Contains Element    locator=//*[@id="checkout_complete_container"]/h2
    Wait Until Element Contains    //*[@id="checkout_complete_container"]/h2    Thank you for your order!
