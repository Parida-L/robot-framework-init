*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test
    SeleniumLibrary.Open Browser    https://www.amazon.fr/    browser=chrome
    SeleniumLibrary.Click Element    locator=(//*[@id="sp-cc-accept"])
