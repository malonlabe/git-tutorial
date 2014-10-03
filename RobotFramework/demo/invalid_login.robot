# 02-OCT-2014.
# Robot Framework courses

*** Settings ***
Library        Selenium2Library

# run in beginning and end of set of tests:
Suite Setup     Goto_Login_Page
Suite Teardown  Cleanup_Browser

# run in beginning of every test:
Test Setup      Go to     ${LOGIN_URL}

*** Variables ***
${LOGIN_URL}=       localhost:7272
${USERNAME_VALID}=  demo

*** Keywords ***
Write To Username Field
    [Arguments]     ${username}
    Input Text      username_field   ${username}

Write To Password Field
    [Arguments]     ${username}
    Input Text      password_field   ${username}

Press Button Login
    Click Button    login_button

#function to check that login really failed
Verify Incorrect Page
    Page Should contain     Error Page
    Page Should contain     Login failed

#function to close browser with cleaning Cookies:
Cleanup_Browser
    Delete All Cookies
    Close Browser

Goto_Login_Page
    Open Browser            url=${LOGIN_URL}

*** Test cases ***
Invalid Login with invalid Password
    #[Setup]     Goto Login Page
    Write To Username Field     ${USERNAME_VALID}
    Write To Password Field     incorrect
    Press Button Login
    Verify Incorrect Page
    #[Teardown]    Cleanup Browser

Invalid Login with empty Password
    #[Setup]     Goto Login Page
    Write To Username Field     ${USERNAME_VALID}
    Write To Password Field     ${EMPTY} # an EMPTY line
    Press Button Login
    Verify Incorrect Page


