*** Settings ***
Documentation    Test cases for RobotFramework with SauceDemo
Resource    ../resources/keywords/keywords_saucedemo.robot

*** Test Cases ***
Scenario: Verify Authentication With Standard User Credentials
    [Documentation]    This test verifies the user can log in successfully to with their credentials
    Given I Am Logged In AS A Standard User
    When I Log Out
    Then I Should Be Logged Out Successfully

Scenario: Verify Authentication With Locked Out User Credentials
    [Documentation]    This test verifies the user cannot log in with locked out user credentials
    Given I Navigate To The SauceDemo Homepage
    When I Log In With Locked Out User Credentials
    Then I Should See An Error Message

Scenario: Test Checkout Process
    [Documentation]    This test verifies the user can complete the checkout process
    Given I Am Logged In As A Standard User
    When I Select The Two Most Expensive Products
    Then I Can Order The Products
