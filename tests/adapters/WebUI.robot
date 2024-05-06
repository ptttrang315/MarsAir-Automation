*** Settings ***
Resource    ../libraries/WebUI.robot
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