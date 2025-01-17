*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot
Resource         ../keywords/keywords_common.robot
Resource         ../keywords/keywords_decath.robot

*** Keywords ***
#GHERKIN
I Search For "Product A" On Decathlon Website
    [Documentation]    This keyword searches for a bonnet on the Decathlon website.
    Open Website Homepage    url=${BASE_URL}[dct]   site_name=${SITE_NAME}[dct]
    Handle Cookies Banner    cookie=${COOKIES_OK}[dct]
    Search For Item    item=${SEARCH_TERM}[dct]

I Add The First Corresponding Item To The Cart
    [Documentation]    This keyword adds the first corresponding item to the cart.
    Add First Item To Cart

I Should Be Able To See The "Product A" In The Cart
    [Documentation]    This keyword verifies if the item was added to the cart.
    Verify Item In Cart
    Close Browser

#SOUS KEYWORDS 

Search For Item
    [Documentation]    Search for an item on the Decathlon website.
    [Arguments]    ${item}
    Input Text    css=[type="search"]    text=${item}
    Press Keys    css=[type="search"]    RETURN
    Wait Until Page Contains Element    css=.product-list
    Wait Until Page Contains    ${item}

Add First Item To Cart
    [Documentation]    Add the first displayed item to the cart.
    Click Element    ${ITEM_LOCATOR}
    Click Button    ${ADD_CART_LOCATOR}
    Wait Until Page Contains Element    locator=${FIRST_CARD_LOC}
    Wait Until Page Contains    text=${ITEM_TITLE}
    Wait Until Page Contains Element    locator=${ADD_BTN}
    Click Button    locator=${ADD_BTN}

Verify Item In Cart
    [Documentation]    Check if the item was added to the cart
    Click Element    locator=${CART_ICON}
    Wait Until Page Contains    text=${CART_ASSERT}
    Wait Until Page Contains    text=${ITEM_CART_ASS}
