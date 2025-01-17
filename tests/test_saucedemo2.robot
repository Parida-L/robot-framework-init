*** Settings ***
Documentation    Test cases for RobotFramework with SauceDemo
Resource    ../resources/keywords/keywords_saucedemo.robot
Resource    ../resources/keywords/keywords_common.robot

*** Test Cases ***
Login With Locked Out Profile
    [Documentation]    This test verifies the user can log in successfully to with their credentials
    Open Website Homepage    ${BASE_URL}[sd]    ${SITE_NAME}[sd]
    Login From Login Page    ${SD_LOGIN}[lck]    ${PWD}[sd]    ${LOGIN_INPUT}[sd]    ${PWD_INPUT}[sd]    ${CONTINUE}[sd]
    Verify Error Message
    Close Browser
