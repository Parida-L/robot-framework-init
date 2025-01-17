*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
Navigate To Login Page
    [Documentation]    Go to the login page
    Wait Until Page Contains Element    locator=${LOGIN_LOCATOR}
    Click Element    locator=${LOGIN_LOCATOR}
    Wait Until Page Contains    text=${LOGIN_INPUT_NAME}

Login
    [Documentation]    Login with given credentials on Amazon
    Wait Until Page Contains Element    locator=${LOGIN_INPUT}[amz]
    #Input Text    locator=${LOGIN_INPUT}    text=${EMAIL}
    #Wait Until Page Contains Element    locator=${CONTINUE_BTN}[amz]
    #Click Element    locator=${CONTINUE_BTN}[amz]
    # Wait Until Page Contains    text=${login}
    # Wait Until Page Contains    text=${PASSWORD_INPUT_NAME}
    # Input Text    locator=${log_input}    text=${login}
    # Input Password    locator=${pwd_input}    password=${pwd}
    # Click Button    locator=${submit_btn}