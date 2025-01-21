*** Settings ***
Documentation    Test cases for DemoQA 
Resource         ../resources/keywords/keywords_demoqa.robot

*** Test Cases ***
Scenario: Test the Bookstore Application
    [Documentation]    This test verifies the user can interact with the Bookstore application
    Given I Am On The Bookstore Application
    When I Search For ${BOOK_TITLE}
    Then I Should Be Able To See The Corresponding Author
    
Scenario: Test the Bookstore Login
    [Documentation]    This test verifies the user can login to the Bookstore application
    Given I Register From The Bookstore Login Page
    When I Am Redirected To The Main Page
    Then The Correct Username Placeholder Should Be Present

Scenario: Test the interactions page
    [Documentation]    This test verifies the user can interact with the Interactions page
    Given I Am On The Selectable Of Interactions Page
    When I Select ${OPTION_A} And ${OPTION_B} On The List Tab
    And I Select ${OPTION_C}, ${OPTION_D} And ${OPTION_E} On The Grid Tab
    Then I Should Be Able To See All The Items Selected Back In The Lab Tab

Scenario: Test the Widgets page
    [Documentation]   This test verifies the user can interact with the Widgets page
    Given I Am On The Date Picker Of Widgets Page
    When I Select "5 November 2035" At "23:45"
    Then I Should Be Able To See The Date Selected

Scenario: Test the alerts page
    [Documentation]    This test verifies the user can interact with the Alerts page
    Given I Am On The Alerts, Frame & Windows Page
    When I Click On Each Button And Verify The Alerts
    Then I Should Be Able To See The Confirming Messages

Scenario: Test the elements page
    [Documentation]    This test verifies the user can interact with the Elements page
    Given I Am On Checkbox Elements Page
    When I Select All Checkboxes Except ${CHECKBOX_A} And ${CHECKBOX_B}
    Then I Should Be Able To See The Items Selected




