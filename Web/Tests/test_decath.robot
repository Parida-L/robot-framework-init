*** Settings ***
Documentation    Test case to search for "bonnet" on Decathlon and add the first item to the cart.
Resource         ../Ressources/keywords.robot

*** Test Cases ***
Search And Add To Cart
    [Documentation]    This test opens Decathlon, searches for "bonnet," and adds the first displayed item to the cart.
    Open Decathlon Homepage
    Accept Cookies
    Search For Item    ${SEARCH_TERM}
    Add First Item To Cart
    Close Browser
