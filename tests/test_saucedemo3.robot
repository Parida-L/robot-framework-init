*** Settings ***
Documentation    Test cases for RobotFramework with SauceDemo
Resource    ../resources/keywords/keywords_saucedemo.robot
Resource    ../resources/keywords/keywords_common.robot

*** Test Cases ***
Test Checkout Process
    [Documentation]    This test verifies the user can complete the checkout process
    Open Website Homepage    ${BASE_URL}[sd]    ${SITE_NAME}[sd]
    Login From Login Page    ${SD_LOGIN}[std]    ${PWD}[sd]    ${LOGIN_INPUT}[sd]    ${PWD_INPUT}[sd]    ${CONTINUE}[sd]
    Verify User Is Logged In    welcome_text=${WELCOME_TEXT}[sd]
    Sort Products By Price
    Add Two Most Expensive Products To Cart
    Go To Cart And Verify Products
    Enter Customer Information And Verify Prices
    Complete The Order
    Verify Order Completion
