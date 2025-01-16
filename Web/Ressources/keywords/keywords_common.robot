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

Accept Cookies
    [Documentation]    Accept the cookies
    [Arguments]    ${accept_cookies}
    Wait Until Page Contains Element    locator=${accept_cookies}
    Click Element    locator=${accept_cookies}

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
