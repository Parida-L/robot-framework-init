*** Settings ***
Documentation    Test case to search for "bonnet" on Decathlon and add the first item to the cart.
Resource         ../resources/keywords/keywords_common.robot
Resource         ../resources/keywords/keywords_amazon.robot

*** Test Cases ***
Login to website account
    [Documentation]    This test opens Amazon, accept the cookies,and login into their account
    Open Website Homepage    ${BASE_URL}[amz]    ${SITE_NAME}[amz]
    Handle Cookies Banner    ${COOKIES_OK}[amz]
    Navigate To Login Page
    Login With Credentials    ${EMAIL_ADDRESS}    ${PASSWORD}[amz]
    Close Browser
