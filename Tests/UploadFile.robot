*** Settings ***
Documentation    PitchVision Player login & Portal verification
Library          Selenium2Library
Library          RequestsLibrary
Resource        ..//Tests/basic.robot

*** Test Cases ***
Start Application
    Open Browser and navigate to URL
    Title of webPage

Login Valid user credentials
    Click Login button to redirect
    sleep           ${sleep}
    Login With Valid data

Verify the login details
    sleep               ${sleep}
    ${cur_URL}=         get location
    log to console      ${cur_URL}
    should be equal     ${cur_URL}      https://www.pitchvision.com/#/daisy
    sleep               ${sleep}

Portal Page Verification
    Move to Portal
    Verify the link
    sleep               ${sleep}


Upload File via Portal video
    Click on portal button
    sleep           5
    Enter Session name
    sleep           2
    Select date
    sleep           2
    Enter Venue name
    Enter Description
    sleep           2
    Select match option
    Select type of the video
    Select Player type
    Choice the file to upload

*** Variables ***
${Upload}           xpath=//a[contains(text(),'Upload')]

${Session}          xpath=//input[@name='session']

${Date}             xpath=//input[@placeholder='yyyy/mm/dd']

${Select_Date}      xpath=//div[@class='form-control-wrapper session-date']//button[@class='btn btn-sm btn-info ng-binding'][contains(text(),'Today')]

${Venue}            xpath=//input[@name='venue']

${Description}      xpath=//input[@name='description']

${select_match}     xpath=//label[@class='btn btn-primary waves-effect media-source ng-pristine ng-untouched ng-valid ng-binding ng-scope active']

${Document}         xpath=//label[@class='btn btn-primary waves-effect media-source ng-valid ng-binding ng-scope active ng-dirty ng-valid-parse ng-touched']

${Batting}          xpath=//label[contains(text(),'Batting')]

${uploadfile}       xpath=//button[@class='btn btn-primary btn-sm']

*** Keywords ***

Click on portal button
    click element   ${Upload}

Enter Session name
    input text      ${Session}      Robot FrameWork

Select date
    click element   ${Date}
    sleep           2
    click element   ${Select_Date}

Enter Venue name
    input text      ${Venue}        Gurgaon Venue

Enter Description
    input text      ${Description}      This is my frist video uploaded via robot framework

Select match option
    click element   ${select_match}

Select type of the video
    click element   ${Document}

Select Player type
    click element   ${Batting}

Choice the file to upload
    #click element  ${ChoiceFile}
    Choose File     ${uploadfile}    /Users/reenupanwar/Desktop/Read.xlsx
    sleep            10







