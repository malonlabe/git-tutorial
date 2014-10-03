*** Variables ***
${LOGIN_URL}=            localhost:7272 
${VALID_USERNAME}=       demo
${VALID_PASSWORD}=       mode
${WELCOME_PAGE_STRING}=  Welcome Page
${INVALID USERNAME}=     root
${INVALID PASSWORD}=     swordfish

*** Keywords ***
In_the_username_field_enter_text
    [Arguments]           ${USERNAME}
    Sleep                 0.4
    Input Text            username_field    ${USERNAME}

In_the_password_field_enter_text
    [Arguments]           ${USERNAME}
    Input Password        password_field    ${USERNAME}

Verify_welcome_page_is_open
    Page_Should_Contain   ${WELCOME_PAGE_STRING}

Verify_error_page_is_open
    Page_Should_Contain   ${expected}

Login
    Click_Button          login_button
