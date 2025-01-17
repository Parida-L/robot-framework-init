*** Settings ***
Documentation    Test case to search for "bonnet" on Decathlon and add the first item to the cart.
Resource         ../resources/keywords/keywords_decath.robot
Resource         ../resources/keywords/keywords_common.robot

*** Test Cases ***
Search And Add To Cart
    [Documentation]    This test opens Decathlon, searches for "bonnet," and adds the first displayed item to the cart.
    Open Website Homepage    url=${BASE_URL}[dct]   site_name=${SITE_NAME}[dct]
    Handle Cookies Banner    cookie=${COOKIES_OK}[dct]
    Search For Item    item=${SEARCH_TERM}[dct]
    Add First Item To Cart
    Close Browser
