*** Settings ***
Resource        ../adapters/WebUI.robot

Test Setup      Open Browser    https://marsair.recruiting.thoughtworks.net/TrangPham


*** Test Cases ***
Verify that can click on "Book a ticket to the red planet now!" label in "Search Result" page to go home page
    [Tags]    us3    linktohomepage
    ${locator}    Get Element By Type    text    Book a ticket to the red planet now!
    Take Screenshot
    Click Element    HomePage.SearchBtn
    ${locator}    Get Element By Type    text    Book a ticket to the red planet now!
    Take Screenshot

Verify that go to the home page by clicking on the "MarsAir" logo
    [Tags]    us3    logomarsair
    [Template]    Click on MarsAir logo to go to the home page
    from Home page    MarsAir.Logo    Welcome to MarsAir!
    from Search Results page    HomePage.SearchBtn    Search Results

Verify that go to the home page by clicking on the "MarsAir" logo from report pages
    [Tags]    us3    logomarsairfromreports
    [Template]    Click on MarsAir logo from reports page to go to the home page
    https://marsair.recruiting.thoughtworks.net/TrangPham/report    New issue report
    https://marsair.recruiting.thoughtworks.net/TrangPham/issues    Open Issues


*** Keywords ***
Click on MarsAir logo to go to the home page
    [Arguments]    ${fromPage}    ${locator}    ${pageName}
    Click Element    ${locator}
    Get Element By Type    text    ${pageName}
    Take Screenshot
    Click Element    MarsAir.Logo
    Get Element By Type    text    Welcome to MarsAir!
    Take Screenshot

Click on MarsAir logo from reports page to go to the home page
    [Arguments]    ${reportLink}    ${pageName}
    [Setup]    Open Browser    ${reportLink}
    Get Element By Type    text    ${pageName}
    Take Screenshot
    Click Element    MarsAir.Logo
    Get Element By Type    text    Welcome to MarsAir!
    Take Screenshot
