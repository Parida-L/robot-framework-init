*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
Open Website Homepage
    [Documentation]    Open the website homepage.
    [Arguments]    ${url}    ${site_name}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=body
    Wait Until Page Contains    text=${site_name}

Navigate To Login Page
    [Documentation]    Go to the login page
    Wait Until Page Contains Element    locator=${LOGIN_LOCATOR}
    Click Element    locator=${LOGIN_LOCATOR}
    Wait Until Page Contains    text=${LOGIN_INPUT_NAME}
    Wait Until Page Contains Element    locator=${LOGIN_INPUT}

Login With Credentials
    [Documentation]    Login with given credentials
    [Arguments]    ${login}    ${password}
    Wait Until Page Contains Element    locator=${LOGIN_INPUT}
    Input Text    locator=${LOGIN_INPUT}    text=${EMAIL_ADDRESS}
    Click Button    locator=${CONTINUE_BTN}
    Wait Until Page Contains    text=${EMAIL_ADDRESS}
    Wait Until Page Contains    text=${PASSWORD_INPUT_NAME}
    Input Password    locator=${PASSWORD_INPUT}    password=${PASSWORD}
    Click Button    locator=${SUBMIT_BTN_LOGIN}[amz]
    Wait Until Page Contains    text=${WELCOME_TEXT}

Close Browser
    [Documentation]    Close the browser.
    Close All Browsers

Handle Cookies Banner
    [Documentation]    Handle cookies dynamically based on the provided action and cookie locator.
    [Arguments]    ${cookie_locator}
    ${is_cookie_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${cookie_locator}
    IF    ${is_cookie_displayed}    Handle Cookie Action    ${cookie_locator}

Handle Cookie Action
    [Documentation]    Perform the specified cookie action (accept/reject) using the given locator.
    [Arguments]    ${cookie_locator}
    Wait Until Page Contains Element    locator=${cookie_locator}
    Click Element    locator=${cookie_locator}
