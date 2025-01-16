*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
# Open Website Homepage
#     [Documentation]    Open the Decathlon homepage.
#     Open Browser    ${BASE_URL}[dct]    ${BROWSER}
#     Maximize Browser Window
#     Wait Until Page Contains Element    css=body
#     Wait Until Page Contains    text=${SITE_NAME}[dct]

# Accept Cookies
#     [Documentation]    Accept the cookies
#     Wait Until Page Contains Element    locator=${COOKIES_OK_DCT}
#     Click Element    locator=${COOKIES_OK_DCT}

# Search For Item
#     [Documentation]    Search for an item on the Decathlon website.
#     Input Text    css=[type="search"]    text=${SEARCH_TERM}[dct]
#     Press Keys    css=[type="search"]    RETURN
#     Wait Until Page Contains Element    css=.product-list
#     Wait Until Page Contains    ${SEARCH_TERM}[dct]

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

# Close Browser
#     [Documentation]    Close the browser.
#     Close All Browsers

# Navigate To Login Page
#     [Documentation]    Go to the login page
#     Wait Until Page Contains Element    locator=${LOGIN_ICON}
#     Click Element    locator=${LOGIN_ICON}
#     Wait Until Page Contains Element    locator=${LOGIN_TITLE_LOCATOR}
#     Wait Until Page Contains    text=${LOGIN_TITLE}
#     Wait Until Page Contains Element    locator=${EMAIL_INPUT}

# Login With Credentials
#     [Documentation]    Login with given credentials
#     Wait Until Page Contains Element    locator=${EMAIL_INPUT}
#     Input Text    locator=${EMAIL_INPUT}    text=${EMAIL_ADDRESS}
#     Click Button    locator=${CONTINUE_BTN}
#     Wait Until Page Contains    text=${EMAIL_ADDRESS}
#     Wait Until Page Contains    text=${PASSWORD_INPUT_NAME}
#     Input Password    locator=${PASSWORD_INPUT}    password=${PASSWORD}
#     Click Button    locator=${SUBMIT_BTN_LOGIN}
#     Wait Until Page Contains    text=${WELCOME_TEXT}
