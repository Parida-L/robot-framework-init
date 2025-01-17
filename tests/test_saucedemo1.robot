*** Settings ***
Documentation    Test cases for RobotFramework with SauceDemo
Resource    ../resources/keywords/keywords_saucedemo.robot
Resource    ../resources/keywords/keywords_common.robot

*** Test Cases ***
Test Authentication With Standard User Credentials
    [Documentation]    This test verifies the user can log in successfully to with their credentials
    Open Website Homepage    ${BASE_URL}[sd]    ${SITE_NAME}[sd]
    Login From Login Page    ${SD_LOGIN}[std]    ${PWD}[sd]    ${LOGIN_INPUT}[sd]    ${PWD_INPUT}[sd]    ${CONTINUE}[sd]
    Verify User Is Logged In    welcome_text=${WELCOME_TEXT}[sd]
    Log Out
    Close Browser
