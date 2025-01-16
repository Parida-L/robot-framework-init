*** Settings ***
Documentation    Test cases for RobotFramework with SauceDemo
Resource    ../resources/keywords/keywords_saucedemo.robot
Resource    ../resources/keywords/keywords_common.robot

*** Test Cases ***
Login With Standard User Profile
    [Documentation]    This test verifies the user can log in successfully to with their credentials
    Open Website Homepage    ${BASE_URL}[sd]    ${SITE_NAME}[sd]
    # Navigate To Login Page
    # Login With Credentials

# Log Out From Profile 
#     [Documentation]    This test verified the user is correctly logged out
