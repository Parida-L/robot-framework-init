*** Settings ***
Resource         ../libraries.resource
Resource         ../variables.robot
Resource         ../keywords/keywords_common.robot

*** Keywords ***
#GHERKIN   

#BOOKSTORE
I Am On The Bookstore Application
    [Documentation]    Open the Bookstore application.
    Open Website Homepage    ${DMQ_URL}[bk]    ${PAGE_NAME}[bk]
    Verify The Page Is Correct   ${PAGE_NAME}[bk]    spe_loc=${SPE_LOC}[bk]

I Search For ${BOOK_TITLE}
    [Documentation]    Search for the book title.
    Type The Book Title In The Search Bar    ${BOOK_TITLE}

I Should Be Able To See The Corresponding Author
    [Documentation]    Verify the corresponding author is displayed.
    Verify The Correct Book Is Displayed    ${BOOK_TITLE}    ${AUTHOR}
    Close Browser

#LOGIN
I Register From The Bookstore Login Page
    [Documentation]    Register a new user from the bookstore login page.
    Open Website Homepage    ${DMQ_URL}[log]    ${PAGE_NAME}[log]
    Verify The Page Is Correct   ${PAGE_NAME}[log]    spe_loc=${SPE_LOC}[log]
    Navigate To The Register Page
    ${unique_username}=    Generate Unique Username    Scarface
    Fill The Registration Form    ${unique_username}
    Verify The Alert Message

I Am Redirected To The Main Page
    [Documentation]    Redirect to the main page.
    Wait Until Page Contains    ${PAGE_NAME}[bk]

The Correct Username Placeholder Should Be Present
    [Documentation]    Verify the correct username placeholder is displayed.
    Wait Until Page Contains Element    //*[@id="userName"]
    ${placeholder_text}=    Get Element Attribute    id=userName    placeholder
    Should Be Equal    ${placeholder_text}    UserName
    Close Browser

#INTERACTIONS

I Am On The Selectable Of Interactions Page
    [Documentation]    Open the Selectable page of the Interactions section.
    Open Website Homepage    ${DMQ_URL}[int]    ${PAGE_NAME}[int]
    Navigate To The Selectable Page

I Select ${OPTION_A} And ${OPTION_B} On The List Tab
    [Documentation]    Select "OPTION A" and "OPTION B" on the list tab.
    Select Options In The List Tab    ${OPTION_A}    ${OPTION_B}
    Verify The Options Are Selected In The List Tab    ${OPTION_A}    ${OPTION_B}

I Select ${OPTION_C}, ${OPTION_D} And ${OPTION_E} On The Grid Tab
    [Documentation]    Select "OPTION C" on the grid tab.
    Select Options And Verify In The Grid Tab    ${OPTION_C}    ${OPTION_D}    ${OPTION_E}

I Should Be Able To See All The Items Selected Back In The Lab Tab
    [Documentation]    Verify all the items are selected in both tabs.
    Click Element                    demo-tab-list
    Verify The Options Are Selected In The List Tab    ${OPTION_A}    ${OPTION_B}
    Close Browser

#WIDGETS

I Am On The Date Picker Of Widgets Page
    [Documentation]    Open the Date Picker page of the Widgets section.
    Open Website Homepage    ${DMQ_URL}[dp]    ${PAGE_NAME}[dp]
    Verify The Page Is Correct   ${PAGE_NAME}[dp]    spe_loc=${SPE_LOC}[dp]

I Select "5 November 2035" At "23:45"
    [Documentation]    Select the date and time.
    Select The Date
    Select The Time

I Should Be Able To See The Date Selected
     [Documentation]    Verify the date is selected.
     Verify The Date And Time Selected
     Close Browser

I Am On The Alerts, Frame & Windows Page
    [Documentation]    Open the Alerts, Frame & Windows page.
    Open Website Homepage    ${DMQ_URL}[alt]    ${PAGE_NAME}[dp]
    Verify The Page Is Correct   ${PAGE_NAME}[alt]    spe_loc=${SPE_LOC}[alt]

I Click On Each Button And Verify The Alerts
    [Documentation]    Click on each button and verify the alerts.
    # To be implemented
    # Click On Each Button And Verify The Alerts

I Should Be Able To See The Corresponding Alerts
    [Documentation]    Verify the corresponding alerts.
    # To be implemented


#SOUS KEYWORDS    

Verify The Page Is Correct
    [Documentation]    Verify the page is correct.
    [Arguments]    ${page_name}    ${spe_loc}
    Wait Until Page Contains    ${page_name}
    Wait Until Page Contains Element    ${spe_loc}

Type The Book Title In The Search Bar
    [Documentation]    Type the book title in the search bar.
    [Arguments]    ${book_title}
    Input Text    xpath=//*[@id="searchBox"]    ${book_title}
    Press Keys    xpath=//*[@id="searchBox"]    ENTER

Verify The Correct Book Is Displayed
    [Documentation]    Verify the correct book is displayed.
    [Arguments]    ${book_title}    ${author}
    Wait Until Page Contains    ${book_title}
    Wait Until Page Contains    ${author}

Navigate To The Register Page
    [Documentation]    Navigate to the register page.
    Wait Until Page Contains Element    //*[@id="newUser"]
    Click Element    //*[@id="newUser"]
    Wait Until Page Contains Element    //*[@id="register"]
    Wait Until Page Contains    Register

Generate Unique Username
    [Documentation]    Generates a unique username by appending random numbers and special characters.
    [Arguments]    ${base_username}=Scarface
    ${special_chars}=    Set Variable    !@#$%^&*
    ${digits}=    Set Variable    0123456789
    # Generate 3 random digits
    ${random_number}=    Evaluate    ''.join(random.choices('${digits}', k=3))    modules=random
    # Generate 2 random special characters
    ${random_special}=    Evaluate    ''.join(random.choices('${special_chars}', k=2))    modules=random
    # Combine base username, random number, and special characters
    ${unique_username}=    Set Variable    ${base_username}${random_number}${random_special}
    # Log the generated username
    Log    Generated Username: ${unique_username}
    RETURN    ${unique_username}

Fill The Registration Form
    [Documentation]    Fill the registration form.
    [Arguments]    ${unique_username}
    Input Text    //*[@id="firstname"]    Tony
    Input Text    //*[@id="lastname"]    Montana
    Generate Unique Username    Scarface
    Input Text    //*[@id="userName"]    ${unique_username}
    Input Text    //*[@id="password"]    T0ny@123
    # Le recaptcha fait son travail ainsi on attend 60 secondes pour manuellement le faire
    Sleep    60s    reason=wait to fill the captcha manually
    Click Button    //*[@id="register"]

Verify The Alert Message
    [Documentation]    Verify the alert message.
    Alert Should Be Present    text=User Register Successfully.

Navigate To The Selectable Page
    [Documentation]    Navigate to the Selectable page.
    Wait Until Element Is Visible    //span[.='Selectable']
    Wait Until Element Is Enabled    //span[.='Selectable']
    Scroll Element Into View         //span[.='Selectable']
    Click Element                    //span[.='Selectable']
    Wait Until Page Contains    Selectable

Select Options In The List Tab
    [Documentation]    Select options in the list tab.
    [Arguments]    ${option_a}    ${option_b}
    Click Element                    demo-tab-list
    Wait Until Page Contains        ${option_a}[text]
    Click Element                   ${option_a}[locator]
    Wait Until Page Contains        ${option_b}[text]
    Click Element                   ${option_b}[locator]

Verify The Options Are Selected In The List Tab
    [Documentation]    Verify the options are selected in the list tab.
    [Arguments]    ${option_a}    ${option_b}
    Element Attribute Value Should Be    ${option_a}[locator]    class    
    ...    mt-2 list-group-item active list-group-item-action
    Element Attribute Value Should Be    ${option_b}[locator]    class    
    ...    mt-2 list-group-item active list-group-item-action

Select Options And Verify In The Grid Tab
    [Documentation]    Select options in the grid tab.
    [Arguments]    ${option_c}   ${option_d}    ${option_e}
    Click Element                    demo-tab-grid
    Click Element                   ${option_c}[locator]
    Element Attribute Value Should Be    ${option_c}[locator]    class    
    ...    list-group-item active list-group-item-action
    Click Element                   ${option_d}[locator]
    Element Attribute Value Should Be    ${option_d}[locator]    class
    ...    list-group-item active list-group-item-action
    Wait Until Page Contains        ${option_e}[text]
    Wait Until Element Is Visible    ${option_e}[locator]
    #Scroll Element Into View    ${option_e}[locator]
    #${element}=    Get Webelement    xpath=//*[@id="row3"]/li[3]
    #Execute Javascript    arguments[0].scrollIntoView(true);    ${element}
    Execute Javascript    document.evaluate("//*[@id='row3']/li[3]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    Click Element                   ${option_e}[locator]
    Element Attribute Value Should Be    ${option_e}[locator]    class
    ...    list-group-item active list-group-item-action

Select The Date
        [Documentation]    Select the date.
        Click Element    ${SPE_LOC}[dp]
        Execute Javascript    document.getElementById('datePickerMonthYearInput').value = '';
        Input Text    id=datePickerMonthYearInput    11/05/2035
        Click Element    //*[@id="datePickerContainer"]/div[2]/div[1]

Select The Time
        [Documentation]    Select the time.
        Click Element    //*[@id="dateAndTimePickerInput"]
        Execute Javascript    document.getElementById('dateAndTimePickerInput').value = '';
        Input Text    id=dateAndTimePickerInput    November 5, 2025 11:45 P
        Click Element    //*[@id="datePickerContainer"]/div[2]/div[1]

Verify The Date And Time Selected
        [Documentation]    Verify the date and time are selected.
        Wait Until Page Contains Element    xpath=//*[@id="dateAndTimePickerInput"]
        ${selected_date}=    Get Value    xpath=//*[@id="dateAndTimePickerInput"]
        Should Be Equal As Strings    ${selected_date}    November 5, 2025 11:45 PM
