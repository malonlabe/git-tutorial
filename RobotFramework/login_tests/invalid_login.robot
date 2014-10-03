*** Settings ***
Library          Selenium2Library
Resource         login_resource.robot

#This will call once before any test start:
Suite Setup      Open_Browser   ${LOGIN_URL}

#This will call once in the end of all tests:
Suite Teardown   Close_Browser

#every test will start with this code:
Test Setup       Go_to_login_page

#every test will end with this code:
# Test Teardown    Close Browser

Documentation    This test suite contains tests for
...              testing login with invalid username,
...              invalid password and empty values.
...
...              Verification is done by checking that
...              the error page opens when the login fails.


*** Variables ***
# all variables are in include file.

*** Keywords ***
Go_to_login_page
    # Open_Browser        localhost:7272
    Go to               localhost:7272
    Set Test Variable   ${expected}    Error Page


*** Test cases ***
Invalid login with valid username and invalid password
    [Documentation]   This tests inputs the valid username
    ...               but an invalid password, submits these
    ...               and checks that the error page opens.

    In_the_username_field_enter_text    demo
    In_the_password_field_enter_text    ${INVALID_PASSWORD}
    Login
    Verify_error_page_is_open

Invalid login with invalid username and valid password
    In_the_username_field_enter_text    ${INVALID_USERNAME}
    In_the_password_field_enter_text    ${VALID_PASSWORD}
    Login
    Verify_error_page_is_open

Invalid login with empty password
    In_the_username_field_enter_text    demo
    In_the_password_field_enter_text    ${EMPTY}
    Login
    Verify_error_page_is_open

Invalid login with empty username
    In_the_username_field_enter_text    ${EMPTY}
    In_the_password_field_enter_text    mode
    Login
    Verify_error_page_is_open
    
Invalid login with empty username and empty password
    In_the_username_field_enter_text    ${EMPTY}
    In_the_password_field_enter_text    ${EMPTY}
    Login
    Verify_error_page_is_open
