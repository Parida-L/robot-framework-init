*** Settings ***
Documentation    Test cases for DemoQA 
Resource         ../resources/keywords/keywords_demoqa.robot

*** Test Cases ***

Scenario: Test the Bookstore Application
# Aller sur book store application 
# Rechercher Designing Evolvable et s'assurer que l'auteur est bien Glenn Block et al.
    [Documentation]    This test verifies the user can interact with the Bookstore application
    Given I Am On The Bookstore Application
    When I Search For ${BOOK_TITLE}
    Then I Should Be Able To See The Corresponding Author
    
Scenario: Test the Bookstore Login 
# # Sur la même page, cliquez sur login > register > revenir sur la page de départ 
# # et s'assurer que dans le user name il y a bien le username
     Given I Register From The Bookstore Login Page
     When I Am Redirected To The Main Page
     Then The Correct Username Placeholder Should Be Present

Scenario: Test the interactions page
# # Ensuite, cliquer sur interactions > Selectable et sélectionner Morbi leo risus et Cras justo odio 
    Given I Am On The Selectable Of Interactions Page
    When I Select ${OPTION_A} And ${OPTION_B} On The List Tab
    And I Select ${OPTION_C}, ${OPTION_D} And ${OPTION_E} On The Grid Tab
    Then I Should Be Able To See All The Items Selected Back In The Lab Tab

# Scenario: Test the Widgets page
# # Ensuite sur Widgets, date picker > dans date and time , sélectionner le 5 novembre 2035 à 23h45
#     Given I Am On The Date Picker Of Widgets Page
#     When I Select "5 November 2035" At "23:45"
#     Then I Should Be Able To See The Date Selected

# Scenario: Test the alerts page
# # Dans l'onglet alerts, frame & Windows > aller sur alerts et cliquer sur chaque bouton avec les instructions demander et 
# # assurez vous que l'action est correct (ex : je vérifie que sur le bouton avec la valeur "On button click, prompt box will appear" il y a bien le nom affiché en vert)
#     Given I Am On The Alerts, Frame & Windows Page
#     When I Click On Each Button And Verify The Alerts
#     Then I Should Be Able To See The Corresponding Alerts

# Scenario: Test the elements page
# # ensuite refaite l'étape des checkbox (je sais que vous aimez) 
# # Eléments > Check box > Sélectionner tous les éléments SAUF Office et Excel file.doc
#     Given I Am On The Elements Page
#     When I Select All Checkboxes Except "Office" And "Excel file.doc"
#     Then I Should Be Able To See The Items Selected




