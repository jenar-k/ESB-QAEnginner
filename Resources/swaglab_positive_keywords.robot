*** Settings ***
Library                SeleniumLibrary
Variables              ../Resources/swaglab_locators.yaml

*** Variables ***
${homepage_url}        https://www.saucedemo.com/
${browser_type}        chrome
${valid_username}      standard_user
${valid_password}      secret_sauce
${invalid_username}    standard_jenar
${invalid_password}    invalidpassword
${firstname}           Jenar
${lastname}            Kuswidiardi
${postalcode}          55581

*** Keywords ***
User open Browser Chrome
    [Documentation]                        Open Browser Using Chrome
    Open Browser                           ${homepage_url}                ${browser_type}
    Maximize Browser Window    
    Location Should Be                     ${homepage_url}

Validate login page of Swaglab
    Element Should Be Visible              ${username_column}
    Element Should Be Visible              ${password_column}
    Element Should Be Visible              ${login_button}

User input valid username
    Input Text                            ${username_column}        ${valid_username}

User input valid password
    Input Text                            ${password_column}        ${valid_password}

User click login button
    Click Element                         ${login_button}

Validate the "Products" page after successfuly login
    Wait Until Element Is Visible        ${products_text}
    Element Should Be Visible            ${products_text}

User Choose Backpack Item and puts it in the cart
    Click Element                        ${cart_button_for_backpack}

User go to cart page
    Click Element                        ${cart_button}

Validate Backpack Item appear in the cart page
    Wait Until Element Is Visible        ${backpack_in_cart}
    Element Should Be Visible            ${backpack_in_cart}

User click Checkout button
    Wait Until Element Is Visible        ${checkout_button}
    Click Element                        ${checkout_button}

User input fristname
    Wait Until Element Is Visible       ${firstname_column}
    Input Text                          ${firstname_column}        ${firstname}

User input lastname
    Input Text                          ${lastname_column}         ${lastname}

User input Postal Code
    Input Text                          ${postalcode_column}       ${postalcode}

User click continue button
    Click Element                       ${continue_button}

Validate item is correct
    Wait Until Element Is Visible       ${backpack_preview} 
    Element Should Be Visible           ${backpack_preview}

User click finish button
    Element Should Be Visible           ${finish_button}
    Click Element                       ${finish_button}

Special thanks for order will appear
    Wait Until Element Is Visible       ${thankyou}
    Element Should Be Visible           ${thankyou}