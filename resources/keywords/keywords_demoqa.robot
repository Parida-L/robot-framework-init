*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot

*** Keywords ***

#GHERKIN
I am on the Bookstore Application
    [Documentation]    Open the Bookstore application.
    Open Website Homepage    ${BOOKSTORE_URL}    ${PAGE_NAME}[bk]
    Handle Cookies Banner    ${COOKIE_BANNER}

# I Search For "BOOK TITLE"

# I Should Be Able To See The Corresponding Author


#SOUS KEYWORDS 