*** Settings ***
Resource        ../adapters/WebUI.robot

Suite Setup     Run Keywords    Open Browser    https://marsair.recruiting.thoughtworks.net/TrangPham
...                 AND    Select Option By Value    HomePage.DepartingDropdown    July
...                 AND    Select Option By Value    HomePage.ReturningDropdown    December (two years from now)


*** Test Cases ***
Verify the promotional code with invalid length
    [Tags]    us2    invalidlength
    [Template]    Enter the code
    with 8 characters    AF3-HFK-15    Sorry, code AF3-HFK-15 is not valid
    with 10 characters    AF3-HFK-1590    Sorry, code AF3-HFK-1590 is not valid

Verify the promotional code with valid length and correct format
    [Tags]    us2    validformat
    [Template]    Enter the code
    with standard format    AF3-HFK-159    Promotional code AF3-HFK-159 used: 30% discount!
    with the modulo greater than 9    AF3-HFK-250    Promotional code AF3-HFK-250 used: 30% discount!
    with the first digit equals 0    AF0-HFK-257    Sorry, code AF0-HFK-257 is not valid
    with special characters    A#2-H@K-349    Promotional code A#2-H@K-349 used: 20% discount!
    with spaces    ${SPACE*2}2-${SPACE*3}-518    Promotional code 2- -518 used: 20% discount!
    with all characters are numbers    122-625-349    Promotional code 122-625-349 used: 20% discount!

Verify the promotional code with valid length and incorrect format
    [Tags]    us2    invalidformat
    [Template]    Enter the code
    with the 3rd/ 7th/ 8th character has at least an alphabet    AF2-THF-F46    Sorry, code AF2-THF-F46 is not valid
    with the 3rd/ 7th/ 8th character has at least a special character    AF2-THF-5@7    Sorry, code AF2-THF-5@7 is not valid
    with the 3rd is an alphabet    AFE-THF-527    Sorry, code AFE-THF-527 is not valid
    with the last is an alphabet    AF2-THF-53P    Sorry, code AF2-THF-53P is not valid
    with the last is calculated the modulo wrong    AF2-THF-348    Sorry, code AF2-THF-348 is not valid


*** Keywords ***
Enter the code
    [Arguments]    ${testName}    ${code}    ${expectedMsgCode}
    Input Text    HomePage.PromoCodeInput    ${code}
    Click Element    HomePage.SearchBtn
    Get Text Element    SearchResults.MsgLabel    contains    Call now on 0800 MARSAIR to book!
    Get Text Element    SearchResults.MsgCodeLabel    contains    ${expectedMsgCode}
    [Teardown]    Run Keywords    Take Screenshot
    ...    AND    Click Element    SearchResults.BackLink
