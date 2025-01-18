*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot
Resource         ../keywords/keywords_common.robot

*** Keywords ***
#GHERKIN    

#Scenario: Verify Authentication With Standard User Credentials    

I Am Logged In AS A Standard User
    [Documentation]    This keyword navigates to the SauceDemo homepage
    Open Website Homepage    ${BASE_URL}[sd]    ${SITE_NAME}[sd]
    Login From Login Page    ${SD_LOGIN}[std]    ${PWD}[sd]    ${LOGIN_INPUT}[sd]    ${PWD_INPUT}[sd]    ${CONTINUE}[sd]
    Verify User Is Logged In    welcome_text=${WELCOME_TEXT}[sd]

I Log Out
    [Documentation]    This keyword logs out from Sauce Demo
    Log Out

I Should Be Logged Out Successfully
    [Documentation]    This keyword verifies the user is logged out successfully
    Wait Until Page Contains    text=Accepted usernames are:
    Close Browser

#Scenario: Verify Authentication With Locked Out User Credentials    

I Navigate To The SauceDemo Homepage
    [Documentation]    This keyword navigates to the SauceDemo homepage
    Open Website Homepage    ${BASE_URL}[sd]    ${SITE_NAME}[sd]

I Log In With Locked Out User Credentials
    [Documentation]    This keyword logs in with locked out user credentials
    Login From Login Page    ${SD_LOGIN}[lck]    ${PWD}[sd]    ${LOGIN_INPUT}[sd]    ${PWD_INPUT}[sd]    ${CONTINUE}[sd]

I Should See An Error Message
    [Documentation]    This keyword verifies the user cannot log in with locked out user credentials
    Verify Error Message
    Close Browser

#Scenario: Test Checkout Process    

I Select The Two Most Expensive Products
    [Documentation]    This keyword verifies the user can select the two most expensive products
    Sort Products By Price
    Verify Products Sorted By Price Descending
    Add Two Most Expensive Products To Cart
    Go To Cart And Verify Products

I Can Order The Products
    [Documentation]    This keyword verifies the user can order the products
    Enter Customer Information
    Verify Prices
    Complete The Order
    Verify Order Completion
    Close Browser

#SOUS KEYWORDS  

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
    Wait Until Page Contains    text=Price (high to low)

Add Two Most Expensive Products To Cart
    [Documentation]    This keyword adds the two most expensive products to the cart by dynamically selecting them.
    Wait Until Page Contains Element    locator=//*[@id="inventory_container"]
    Wait Until Page Contains    text=Price (high to low)
    # Add the first product to the cart
    ${first_product_add_button}=    Get Webelement    //*[@id="inventory_container"]/div/div[1]//button[contains(@id, "add-to-cart")]
    Wait Until Page Contains Element    ${first_product_add_button}
    Click Button    ${first_product_add_button}
    Wait Until Page Contains Element    //*[@id="inventory_container"]/div/div[1]//button[contains(@id, "remove")]

    # Add the second product to the cart
    ${second_product_add_button}=    Get Webelement    //*[@id="inventory_container"]/div/div[2]//button[contains(@id, "add-to-cart")]
    Wait Until Page Contains Element    ${second_product_add_button}
    Click Button    ${second_product_add_button}
    Wait Until Page Contains Element    //*[@id="inventory_container"]/div/div[2]//button[contains(@id, "remove")]
    Wait Until Element Contains    //*[@id="shopping_cart_container"]/a/span    2

Go To Cart And Verify Products
    [Documentation]    This test verifies the user can go to the cart and verify the products
    Click Element    locator=//*[@id="shopping_cart_container"]/a
    Wait Until Page Contains  text=Your Cart
    Wait Until Page Contains Element    locator=//*[@id="cart_contents_container"]/div/div[1]/div[3]
    Wait Until Element Contains    //*[@id="cart_contents_container"]/div/div[1]/div[3]    $49.99
    Wait Until Page Contains Element    locator=//*[@id="cart_contents_container"]/div/div[1]/div[4]
    Wait Until Element Contains    //*[@id="cart_contents_container"]/div/div[1]/div[4]    $29.99

Enter Customer Information
    [Documentation]    This test verifies the user can enter customer information and verify the prices
    Click Button    locator=//*[@id="checkout"]
    Wait Until Page Contains    text=Checkout: Your Information
    Input Text    locator=//*[@id="first-name"]    text=Damien
    Input Text    locator=//*[@id="last-name"]    text=Automatisation
    Input Text    locator=//*[@id="postal-code"]    text=75000
    Click Button    locator=//*[@id="continue"]

Verify Prices
    [Documentation]    This test verifies the prices
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

Verify Products Sorted By Price Descending
    [Documentation]    This keyword verifies that products are sorted by price from highest to lowest.
    Wait Until Page Contains Element    locator=//*[@id="inventory_container"]
    Wait Until Page Contains    text=Price (high to low)
    ${product_prices}=    Get Webelements    //*[@id="inventory_container"]//div[@class="inventory_item_price"]
    ${prices}=    Create List
    # Extract prices from the page and convert them to numbers
    FOR    ${price_element}    IN    @{product_prices}
        ${price_text}=    Get Text    ${price_element}
        ${price}=    Convert To Number    ${price_text.replace('$', '')}
        Append To List    ${prices}    ${price}
    END
    # Copy the original list of prices to create a sorted version
    ${sorted_prices}=    Copy List    ${prices}
    # Sort the copied list in ascending order
    Sort List    ${sorted_prices}  
    # Reverse the sorted list to descending order
    Reverse List    ${sorted_prices}  
    # Compare the original list of prices with the sorted list
    Should Be Equal As Strings    ${prices}    ${sorted_prices}
