*** Settings ***
Resource    ../adapters/WebUI.robot
Suite Setup    Open Browser   https://marsair.recruiting.thoughtworks.net/TrangPham

*** Keywords ***
Search Tickets
    [Arguments]    ${departure}    ${return}    ${expectedMsg}
    Click Element    HomePage.DepartingDropdown
    Select Option By Value    HomePage.DepartingDropdown    ${departure}
    Select Option By Value    HomePage.ReturningDropdown    ${return}
    Click Element    HomePage.SearchBtn
    ${text}    Get Text Element    SearchResults.MsgLabel    contains    ${expectedMsg}
    [Teardown]    Click Element    MarsAir.Logo

*** Test Cases ***
Verify the message when selecting the "Return" is less than one year from the "Departure"
    [Template]    Search Tickets
    [Tags]    US4    LessThanOneYear
    December    December    Unfortunately, this schedule is not possible. Please try again.
    December    July (next year)    Unfortunately, this schedule is not possible. Please try again.
