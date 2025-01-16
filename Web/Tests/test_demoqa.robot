# Given a user is on the login page
# When the user enters their username and password and clicks the login button
# Then the user should be directed to the home page.

# *** Test Cases ***
# Login With User Credentials
#     Given I am on the login page
#     When I login with username and password 
#     Then I should see the welcome page

# Login With Invalid User
#     Given I am on the login page
#     When I login with username "invalid" and password "invalid"
#     Then I should see the error message
#     And I should be able to login again