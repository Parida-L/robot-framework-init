*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***
Open Website Homepage
    [Documentation]    Open the Decathlon homepage.
    [Arguments]    ${url}    ${site_name}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=body
    Wait Until Page Contains    text=${site_name}

Search For Item
    [Documentation]    Search for an item on the Decathlon website.
    [Arguments]    ${item}
    Input Text    css=[type="search"]    text=${item}
    Press Keys    css=[type="search"]    RETURN
    Wait Until Page Contains Element    css=.product-list
    Wait Until Page Contains    ${item}

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
