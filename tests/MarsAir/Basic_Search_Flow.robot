*** Settings ***
Resource    ../adapters/WebUI.robot

*** Test Cases ***
Verify that cannot search any tickets when selecting invalid "Departure" and "Return" date
    [Tags]    US1    InvalidDate
    Open Browser    https://marsair.recruiting.thoughtworks.net/TrangPham
    Click Element    HomePage.SearchBtn
    ${text}    Get Text Element    SearchResults.MsgLabel    contains    Sorry, there are no more seats available.
    Log    ${text}