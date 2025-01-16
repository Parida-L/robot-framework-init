*** Settings ***
Resource         ../Ressources/libraries.resource
Resource         ../Ressources/variables.robot

*** Keywords ***
Open Decathlon Homepage
    [Documentation]    Open the Decathlon homepage.
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=body

Accept Cookies
    [Documentation]    Accept the cookies
    Click Element    locator=${ACCEPT_COOKIES}

Search For Item
    [Documentation]    Search for an item on the Decathlon website.
    [Arguments]    ${item}
    Input Text    css=[type="search"]    ${item}
    Press Keys    css=[type="search"]    RETURN
    Wait Until Page Contains Element    css=.product-list
    Wait Until Page Contains    ${SEARCH_TERM}

Add First Item To Cart
    [Documentation]    Add the first displayed item to the cart.
    Click Element    ${ITEM_LOCATOR}
    Click Button    ${ADD_CART_LOCATOR}
    Wait Until Page Contains Element    //*[@id="vtmn-modal-description"]/div/div[2]/div[1]/div/span
    Wait Until Page Contains    text=BONNET DE SKI ADULTE - FISHERMAN - NOIR
    Wait Until Page Contains Element    locator=//*[@id="vtmn-modal-description"]/div/div[2]/div[6]/button    
    Click Button    locator=//*[@id="vtmn-modal-description"]/div/div[2]/div[6]/button

Verify Item In Cart
    [Documentation]    Check if the item was added to the cart
    Click Element    locator=//*[@id="app"]/header/div[1]/nav[1]/div[4]/div[5]/a
    Wait Until Page Contains    text=Panier
    Wait Until Page Contains    text=BONNET

Close Browser
    [Documentation]    Close the browser.
    Close All Browsers
