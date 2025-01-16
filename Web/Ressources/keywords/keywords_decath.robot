*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
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
