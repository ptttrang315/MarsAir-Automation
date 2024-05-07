*** Settings ***
Resource    ../libraries/Utilities.robot


*** Keywords ***
Update XPath value
    [Arguments]    ${xpath}    ${searchFor}    ${replaceWith}
    ${xpath}    Replace String    ${xpath}    ${searchFor}    ${replaceWith}
    RETURN    ${xpath}
