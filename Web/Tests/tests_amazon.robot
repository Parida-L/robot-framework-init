*** Settings ***
Documentation    Test case to search for "bonnet" on Decathlon and add the first item to the cart.
Resource         ../Ressources/keywords/keywords_amazon.robot
Resource         ../Ressources/keywords/keywords_common.robot

*** Test Cases ***
Login to website account
    [Documentation]    This test opens Amazon, accept the cookies,and login into their account
    Open Website Homepage    ${BASE_URL}[amz]    ${SITE_NAME}[amz]
    Handle Cookies Banner    ${COOKIES_OK}[amz]
    Navigate To Login Page
    Login With Credentials
    Close Browser
