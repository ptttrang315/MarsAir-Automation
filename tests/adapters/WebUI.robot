*** Settings ***
Resource    ../libraries/WebUI.robot
Resource    ../libraries/Utilities.robot
Library    trangptt_test_library.utilities.src.test_object.object_repository.ObjectRepository

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}=chromium    ${headless}=${False}    ${wait_until}=load
    New Browser    browser=${browser}    headless=${headless}
    New Page    ${url}    wait_until=${wait_until}

Click Element
    [Arguments]    ${objectId}    ${button}=left
    ${testObject}    findTestObject    ${objectId}
    Click    ${testObject.get_value()}    ${button}

Get Text Element
    [Arguments]    ${objectId}     ${assertion_operator}=None    ${assertion_expected}=None    ${message}=None
    ${testObject}    findTestObject    ${objectId}
    ${text}    Get Text    ${testObject.get_value()}    ${assertion_operator}    ${assertion_expected}    ${message}
    RETURN    ${text}

Select Option By Value
    [Arguments]    ${objectId}    ${value}
    ${testObject}    findTestObject    ${objectId}
    Select Options By    ${testObject.get_value()}    text    ${value}

Get Options In Dropdown List
    [Arguments]    ${objectId}    ${key}=label
    ${testObject}    findTestObject    ${objectId}
    ${options}    Get Select Options    ${testObject.get_value()}
    ${values}    Create List
    FOR    ${option}    IN    @{options}
        Append To List    ${values}    ${option["${key}"]}
    END
    RETURN    ${values}

Input text
    [Arguments]    ${objectId}    ${text}
    ${testObject}    findTestObject    ${objectId}
    Fill Text    ${testObject.get_value()}    ${text}

Get Element By Type
    [Arguments]    ${type}    ${text}
    ${element}    Get Element By    ${type}    ${text}
    RETURN    ${element}
