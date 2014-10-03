# 03-OCT-2014.
# Robot Framework courses

*** Settings ***
#include lib:
Library               Selenium2Library
#include file:
Resource              login_resource.robot

#This will call once in the end of all tests:
Suite Teardown        Cleanup_Browser


*** Variables ***
# all variables are in include file.

*** Keywords ***
Setup_for_successful_login
    Open_Browser      ${LOGIN_URL}
    # Maximize Browser Window

Delete_all_cookies_then_close_the_browser
    Delete_All_Cookies
    Close_Browser

#function to close browser with cleaning Cookies:
Cleanup_Browser
    Delete_All_Cookies
    Close_Browser

Verify_title_equals_to_login_page
    Title_Should_Be   Login Page

Verify_Open_Welcome_Page
    Page_Should_Contain   ${WELCOME_PAGE_STRING}

Press_Button_Login
    Click_Button    login_button

Write_Password
    [Arguments]     ${username}
    Input Text      password_field   ${username}

Write_Username
    #this is a function definition with some parameters:
    [Arguments]     ${username}
    #Input_Text writes second argument to a field, by html ID.
    Input_Text      username_field   ${username}
    #Input_Text      username_field   Get_Username
    
Get_Username
    [Return]        ${VALID_USERNAME}

*** Test cases ***
Valid credentials
    [Setup]  Setup_for_successful_login
    # Log_to_Console      Hello world!
    # Log      Hello world!
    Verify_title_equals_to_login_page
    Write_Username      ${VALID_USERNAME}
    #Input_Text      username_field    ${VALID USERNAME}   # Write username
    Write_Password      ${VALID_PASSWORD}
    # Input_Text      password_field    ${VALID PASSWORD}   # Write password
    Press_Button_Login
    Verify_Open_Welcome_Page

Valid logout
    [Documentation]  This is a test for logging out:
    ...  - Check that we are on the welcome page
    ...  - Log out
    ...  - Check that we are back on the login page
    ...  - Finally clear cookies and close the browser

    #"logout_link" is a object ID from html code.
    Page_Should_Contain_Link    logout_link     #
    Click_Link                  logout_link
    #"Get_Location" is a function which take an address from a browser addressbar;
    ${location}=                Get_Location
    # Log_to_Console              ${location}
    Should_Be_Equal             ${location}    http://${LOGIN_URL}/
    # Delete_all_cookies_then_close_the_browser
