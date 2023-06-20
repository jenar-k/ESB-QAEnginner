*** Settings ***
Documentation          Positive Case
Library                SeleniumLibrary
Resource                ../Resources/swaglab_positive_keywords.robot
Suite Setup             User open Browser Chrome
Suite Teardown          Close Browser

*** Test Cases ***
User Access and Successfuly login into Swaglab Website
    [Tags]                                        Positive Case
    [Documentation]                               Positive Case: Successfuly login and validate the page
    Validate login page of Swaglab
    User input valid username
    User input valid password
    User click login button
    Validate the "Products" page after successfuly login

User Successfuly Checkout Item
    [Tags]                                        Positive Case
    [Documentation]                               Positive Case: Successfuly checkout one item and validate
    User Choose Backpack Item and puts it in the cart
    User go to cart page
    Validate Backpack Item appear in the cart page
    User click Checkout button
    User input fristname
    User input lastname
    User input Postal Code
    User click continue button
    Validate item is correct
    User click finish button
    Special thanks for order will appear

