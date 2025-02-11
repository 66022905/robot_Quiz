*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser  https://www.saucedemo.com/
Suite Teardown      Close Browser

*** Variables ***
${USERNAME}  standard_user
${PASSWORD}  secret_sauce   
${URL}  https://www.saucedemo.com

*** Keywords ***
Input User Name
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click Login Button
    Click Element    //*[@id="login-button"]

Wait For Login Page To Load
    Wait Until Page Contains    กดปุ๋ม login

*** Test Cases ***
Check Translate Result02
    Input User Name    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login Button
    ${current_url} =    Get Location

    Should Be Equal As Strings  ${current_url}  https://www.saucedemo.com/inventory.html
    