*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
Navigate To Login Page
    [Documentation]    Go to the login page
    Wait Until Page Contains Element    locator=${LOGIN_ICON}
    Click Element    locator=${LOGIN_ICON}
    Wait Until Page Contains Element    locator=${LOGIN_TITLE_LOCATOR}
    Wait Until Page Contains    text=${LOGIN_TITLE}
    Wait Until Page Contains Element    locator=${EMAIL_INPUT}

Login With Credentials
    [Documentation]    Login with given credentials
    Wait Until Page Contains Element    locator=${EMAIL_INPUT}
    Input Text    locator=${EMAIL_INPUT}    text=${EMAIL_ADDRESS}
    Click Button    locator=${CONTINUE_BTN}
    Wait Until Page Contains    text=${EMAIL_ADDRESS}
    Wait Until Page Contains    text=${PASSWORD_INPUT_NAME}
    Input Password    locator=${PASSWORD_INPUT}    password=${PASSWORD}
    Click Button    locator=${SUBMIT_BTN_LOGIN}
    Wait Until Page Contains    text=${WELCOME_TEXT}
