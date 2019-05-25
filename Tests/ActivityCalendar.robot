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

Move to the activity page by clicking on it
    Click on Activity Calendar
    sleep               3

Add Activity Calendar for Cricket
    Click Add New Activity
    Select subgroud cricket
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

#Add activity calandar for football
#    Click Add New Activity
#    sleep              4
#    Football_selection
#    Enter Days
#    Enter Hours
#    Enter Minutes
#    Select text values
#    Add activity
#    Activity Verify


Rugby activity calander addition
    Click Add New Activity
    Rugby_Selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Boxing activity calander addition
    Click Add New Activity
    Boxing selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify


Boxing activity calander addition
    Click Add New Activity
    Rowling selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Tennies activity calander addition
    Click Add New Activity
    Tennies selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Netball activity calander addition
    Click Add New Activity
    Netball selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Squash activity calander addition
    Click Add New Activity
    Squash selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Golf activity calander addition
    Click Add New Activity
    Golf Selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify


Hocky activity calander addition
    Click Add New Activity
    Hocky Selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Athlethis activity calander addition
    Click Add New Activity
    Athlethis selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Cycling activity calander addition
    Click Add New Activity
    Cycling selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

Others activity calander addition
    Click Add New Activity
    Others selection
    Enter Days
    Enter Hours
    Enter Minutes
    Select text values
    Add activity
    Activity Verify

*** Keywords ***

Click on Activity Calendar
    sleep           1
    click element   ${ActivityCalander}

Click Add New Activity
    sleep           1
    click element   ${AddNewactivity}

Select subgroud cricket
    sleep           1
    click element   ${Cricket}

Enter Days
    sleep           1
    input text      ${Days}         1

Enter Hours
    sleep           1
    input text      ${Hours}        2

Enter Minutes
    sleep           1
    input text      ${Minutes}      10

Select text values
    sleep           2
    input text      ${Text-area}    This is my best batting

Add activity
    click element   ${Create}


Activity Verify
    click element       ${ViewActivity}
    sleep               3
    ${View}=     Get text            ${VerifyValues}
    log to console     ${View}


Football_selection
    sleep           2
    click element   ${Football}

Rugby_Selection
    sleep           2
    click element   ${Rugby}

Boxing selection
    sleep           2
    click element   ${Boxing}

Rowling selection
    sleep           2
    click element   ${Rowling}

Tennies selection
    sleep           2
    click element   ${Tennis}

Netball selection
    sleep           1
    click element   ${Netball}

Squash selection
    sleep           1
    click element   ${Squadh}

Golf Selection
    sleep           1
    click element   ${Golf}

Hocky Selection
    sleep           1
    click element   ${Hocky}

Athlethis selection
    sleep           1
    click element   ${Athlethis}

Cycling selection
    sleep           1
    click element   ${Cycling}

Others selection
    sleep           1
    click element   ${Others}

*** Variables ***


${ActivityCalander}     xpath=//a[text()='Activity Calendar']
${AddNewactivity}       xpath=//li[@class='public-playlist-cat calendar-tab create-activity']
${Cricket}              xpath=//div[@class='activity-calender-buttons']/button[@class='cricket-button activity-sub-type activity-button']
${Days}                 xpath=//input[@placeholder='Days']
${Hours}                xpath=//input[@placeholder='Hours']
${Minutes}              xpath=//input[@placeholder='Minutes']
${Text-area}            xpath=//textarea[@class='form-control ng-pristine ng-untouched ng-valid']
${Create}               xpath=//span[text()='Create']
${ViewActivity}         xpath=//li[@class='public-playlist-cat calendar-tab view-activity']
${VerifyValues}         xpath=//tr[@class='item ng-scope']/td
${Football}             xpath=//div[@class='activity-calender-buttons']/button[@class='football-button activity-sub-type activity-button active']
${Rugby}                xpath=//div[@class='activity-calender-buttons']/button[@class='rugby-button activity-sub-type activity-button']
${Boxing}               xpath=//div[@class='activity-calender-buttons']//button[@class='boxing-button activity-sub-type activity-button'][contains(text(),'Boxing')]
${Rowling}              xpath=//div[@class='activity-calender-buttons']//button[@class='rowing-button activity-sub-type activity-button'][contains(text(),'Rowing')]
${Tennis}               xpath=//button[@class='tennis-button activity-sub-type activity-button']
${Netball}              xpath=//button[@class='netball-button activity-sub-type activity-button']
${Squadh}               xpath=//button[@class='squash-button activity-sub-type activity-button']
${Golf}                 xpath=//button[@class='golf-button activity-sub-type activity-button']
${Hocky}                xpath=//button[@class='hockey-button activity-sub-type activity-button']
${Athlethis}            xpath=//button[@class='athletics-button activity-sub-type activity-button']
${Cycling}              xpath=//button[@class='cycling-button activity-sub-type activity-button']
${Others}               xpath=//div[@class='activity-calender-buttons']//button[@class='other-button activity-sub-type activity-button'][contains(text(),'Other')]
