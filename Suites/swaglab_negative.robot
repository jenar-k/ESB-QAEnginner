*** Settings ***
Documentation          Positive Case
Library                SeleniumLibrary
Resource                ../Resources/swaglab_negative_keywords.robot
Suite Setup             User open Browser Chrome
Suite Teardown          Close Browser

*** Test Cases ***
User Failed login into Swaglab Website because input wrong password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: input wrong password
    Validate login page of Swaglab
    User input valid username
    User input invalid password
    User click login button
    Error message "Username and password do not match any user in this service" will be appear on the screen

User Failed login into Swaglab Website because input wrong username
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: input wrong username
    Validate login page of Swaglab
    User input invalid username
    User input valid password
    User click login button
    Error message "Username and password do not match any user in this service" will be appear on the screen