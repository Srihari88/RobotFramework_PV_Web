*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary    timeout=20s
Test Teardown    Close Browser
Suite Teardown    Close Browser

*** Test Cases ***
Data Driven Using Templates
    [Tags]    10A
    # Template are used to do data driven testing in rf
    # in order to use template mention template with keyword
    [Template]    Login With Multiple Data
    sree.hari       oneman
    onemansri       Password2
    UserName3       Password3
    daisy.dalia     dentrain

*** Keywords ***
Login With Multiple Data
    [Arguments]    ${uname}    ${pwd}
    Open Browser    https://www.pitchvision.com/#/login    chrome
    Input Text      xpath=//form[@name='pvLoginform']/div/input[@name='username']    ${uname}
    Input Text      xpath=//form[@name='pvLoginform']/div/input[@name='password']      ${pwd}
    click element   xpath=//form[@name='pvLoginform']/div/input[@value='Log In']
    ${Error}=       get text        xpath=//div[@class='new-user-text error-alert login-alert']
    log to console      ${Error}
    Sleep   5s
    Close Browser

*** Variables ***
