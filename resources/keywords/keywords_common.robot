*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.resource

*** Keywords ***
Open Website Homepage
    [Documentation]    Open the website homepage.
    [Arguments]    ${url}    ${site_name}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=body
    Wait Until Page Contains    text=${site_name}

Handle Cookies Banner
    [Documentation]    Handle cookies dynamically based on the provided action and cookie locator.
    [Arguments]    ${cookie}
    ${is_cookie_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${cookie}
    IF    ${is_cookie_displayed}    Handle Cookie Action    ${cookie}

Handle Cookie Action
    [Documentation]    Perform the specified cookie action (accept/reject) using the given locator.
    [Arguments]    ${cookie_locator}
    Wait Until Page Contains Element    locator=${cookie_locator}
    Click Element    locator=${cookie_locator}    

Login From Login Page
    [Documentation]    Login with given credentials
    [Arguments]    ${login}    ${password}    ${login_input}    ${password_input}    ${submit_btn}
    Wait Until Page Contains Element    locator=${login_input}
    Input Text    locator=${login_input}    text=${login}
    Input Password    locator=${password_input}    password=${password}
    Click Button    locator=${submit_btn}

Verify User Is Logged In
    [Documentation]    Verify the user is logged in successfully.
    [Arguments]    ${welcome_text}
    Wait Until Page Contains    text=${welcome_text}

Close Browser
    [Documentation]    Close the browser.
    Close All Browsers
