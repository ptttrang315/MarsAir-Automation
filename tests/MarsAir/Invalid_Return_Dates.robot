*** Settings ***
Resource        ../adapters/WebUI.robot

Suite Setup     Open Browser    https://marsair.recruiting.thoughtworks.net/TrangPham


*** Test Cases ***
Verify the message when selecting the "Return" is less than one year from the "Departure"
    [Tags]    us4    lessthanoneyear
    [Template]    Search Tickets
    December    December    Unfortunately, this schedule is not possible. Please try again.
    December    July (next year)    Unfortunately, this schedule is not possible. Please try again.


*** Keywords ***
Search Tickets
    [Arguments]    ${departure}    ${return}    ${expectedMsg}
    Click Element    HomePage.DepartingDropdown
    Select Option By Value    HomePage.DepartingDropdown    ${departure}
    Select Option By Value    HomePage.ReturningDropdown    ${return}
    Click Element    HomePage.SearchBtn
    ${text}    Get Text Element    SearchResults.MsgLabel    contains    ${expectedMsg}
    [Teardown]    Run Keywords    Take Screenshot
    ...    AND    Click Element    MarsAir.Logo
