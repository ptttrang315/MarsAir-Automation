*** Settings ***
Resource    ../adapters/WebUI.robot
Suite Setup    Open Browser   https://marsair.recruiting.thoughtworks.net/TrangPham

*** Keywords ***
Search Tickets
    [Arguments]    ${departure}    ${return}    ${expectedMsg}
    Click Element    HomePage.DepartingDropdown
    Select Option By Value    HomePage.DepartingDropdown    ${departure}
    Select Option By Value    HomePage.ReturningDropdown    ${return}
    Take Screenshot
    Click Element    HomePage.SearchBtn
    ${text}    Get Text Element    SearchResults.MsgLabel    contains    ${expectedMsg}
    Click Element    MarsAir.Logo

*** Test Cases ***
Verify the search form
    [Tags]    US1   UITest
    Get Text Element    HomePage.DepartureLbl    contains    Departure
    Get Text Element    HomePage.ReturnLbl    contains    Return

Verify the dropdown list of the "Departure" and "Return"
    [Tags]    US1   UITest    DropdownList
    Click Element    HomePage.DepartingDropdown
    ${departureOptions}    Get Options In Dropdown List    HomePage.DepartingDropdown
    Click Element    HomePage.ReturningDropdown
    ${returnOptions}    Get Options In Dropdown List    HomePage.ReturningDropdown
    ${expectedOptions}    Create List    Select...    July    December    July (next year)    December (next year)    July (two years from now)    December (two years from now)
    Should Be Equal    ${departureOptions}    ${expectedOptions}    Departure options are correct
    Should Be Equal    ${returnOptions}    ${expectedOptions}    Return options are correct

Verify that cannot search any tickets when selecting invalid time range for "Departure" and "Return"
    [Template]    Search Tickets
    [Tags]    US1   InvalidDate
    July    July    Sorry, there are no more seats available.
    December (two years from now)    July (next year)    Sorry, there are no more seats available.

Verify that can search successfully any tickets when selecting valid time range for "Departure" and "Return"
    [Template]    Search Tickets
    [Tags]    US1   ValidDate
    July    July (next year)    Sorry, there are no more seats available.
    July    December (two years from now)    Call now on 0800 MARSAIR to book!