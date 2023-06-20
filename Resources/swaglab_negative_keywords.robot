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

User input invalid username
    Input Text                            ${username_column}        ${invalid_username}

User input valid password
    Input Text                            ${password_column}        ${valid_password}

User input invalid password
    Input Text                            ${password_column}        ${invalid_password}

User click login button
    Click Element                         ${login_button}

Error message "Username and password do not match any user in this service" will be appear on the screen
    Wait Until Element Is Visible        ${errorbox}
    Element Should Be Visible            ${errorbox}
    Element Should Be Visible            ${errormessage_wronguser}