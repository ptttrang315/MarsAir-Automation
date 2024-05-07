*** Settings ***
Resource    ../adapters/WebUI.robot
Test Setup    Open Browser    https://marsair.recruiting.thoughtworks.net/TrangPham

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

*** Test Cases ***
Verify that can click on "Book a ticket to the red planet now!" label in "Search Result" page to go home page
    [Tags]    US3    LinkToHomePage
    ${locator}    Get Element By Type    text    Book a ticket to the red planet now!
    Take Screenshot
    Click Element    HomePage.SearchBtn
    ${locator}    Get Element By Type    text    Book a ticket to the red planet now!

Verify that go to the home page by clicking on the "MarsAir" logo
    [Template]    Click on MarsAir logo to go to the home page
    [Tags]    US3    LogoMarsAir
    from Home page    MarsAir.Logo    Welcome to MarsAir!
    from Search Results page    HomePage.SearchBtn    Search Results

Verify that go to the home page by clicking on the "MarsAir" logo from report pages
    [Template]    Click on MarsAir logo from reports page to go to the home page
    [Tags]    US3    LogoMarsAirFromReports
    https://marsair.recruiting.thoughtworks.net/TrangPham/report    New issue report
    https://marsair.recruiting.thoughtworks.net/TrangPham/issues    Open Issues

