*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser  http://automationexercise.com  
Suite Teardown      Close Browser

*** Variables ***
${USERNAME}         788@example.com  
${PASSWORD}         444444          
${LOGIN_URL}        http://automationexercise.com/login
${HOME_URL}         http://automationexercise.com

*** Keywords ***
Input User Name
    [Arguments]    ${username}
    Wait Until Element Is Visible    //*[@name="email"]    timeout=10s
    Input Text    //*[@name="email"]    ${username}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    //*[@name="password"]    timeout=10s
    Input Text    //*[@name="password"]    ${password}

Click Login Button
    Wait Until Element Is Visible    //*[@data-qa="login-button"]    timeout=10s
    Click Element    //*[@data-qa="login-button"]


Wait For Login Page To Load
    Wait Until Element Is Visible    //*[@href="/logout"]    timeout=10s  

Click Logout Button
    Wait Until Element Is Visible    //*[@href="/logout"]    timeout=10s
    Click Element    //*[@href="/logout"]  

Wait For Home Page After Logout
    Wait Until Element Is Visible    //a[contains(text(),'Signup / Login')]    timeout=10s  

*** Test Cases ***
Check Login Success
    Go To    ${LOGIN_URL}
    Input User Name    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login Button
    Wait For Login Page To Load
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    http://automationexercise.com

Check Logout
    Go To    ${LOGIN_URL}
    Input User Name    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login Button
    Wait For Login Page To Load
    Click Logout Button
    Wait For Home Page After Logout
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}   https://automationexercise.com/login
