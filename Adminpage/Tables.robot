*** Settings ***
Documentation    PitchVision Player login & Portal verification
Library          Selenium2Library
Library          RequestsLibrary
Resource        ..//Tests/basic.robot


*** Test Cases ***
Start Application
    Open Browser and navigate to URL
    Maximize Browser Window
    Title of webPage

Login Valid user credentials

    Click Login button to redirect
    sleep           ${sleep}
    Login With Valid data

Verify the login details
    sleep               ${sleep}
    ${cur_URL}=         get location
    log to console      ${cur_URL}
    should be equal     ${cur_URL}      https://www.pitchvision.com/#/AnthonyAdmanstate
    sleep               ${sleep}

Portal Page Verification
    Move to Portal
    Verify the link
    sleep               ${sleep}

Player Management Page
    click element   //a[contains(text(),'Player Management')]
    sleep               ${sleep}
    table header should contain     //thead[@ng-include='templates.header']     SESSION DATE
    table header should contain     //thead[@ng-include='templates.header']     NAME
    table header should contain     //thead[@ng-include='templates.header']     STATUS
    table header should contain     //thead[@ng-include='templates.header']     LATEST SESSION
    table header should contain     //thead[@ng-include='templates.header']     SESSION DATE
    table header should contain     //thead[@ng-include='templates.header']     PERFORMANCE TRACKING
    table header should contain     //thead[@ng-include='templates.header']     SELECT ALL



Portal page Player management
    sleep           ${sleep}
    ${cell}=     Get Element Count  //tbody/tr
    log to console   ${cell}
*** Keywords ***




*** Variables ***


