*** Settings ***
Documentation    Test case to search for "bonnet" on Decathlon and add the first item to the cart.
Resource         ../Ressources/keywords/keywords_decath.robot
Resource         ../Ressources/keywords/keywords_common.robot

*** Test Cases ***
Search And Add To Cart
    [Documentation]    This test opens Decathlon, searches for "bonnet," and adds the first displayed item to the cart.
    Open Website Homepage    ${BASE_URL}[dct]    ${SITE_NAME}[dct]
    Handle Cookies Banner     ${COOKIES_OK}[dct]
    Search For Item    ${SEARCH_TERM}[dct]
    Add First Item To Cart
    Close Browser
