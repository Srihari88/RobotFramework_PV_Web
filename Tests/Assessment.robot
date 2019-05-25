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
    should be equal     ${cur_URL}      https://www.pitchvision.com/#/daisy
    sleep               ${sleep}

Portal Page Verification
    Move to Portal
    Verify the link
    sleep               ${sleep}

Move to on Assessment Page
    Click assessment
    sleep    ${sleep}
    Capture assessment titles

Quit Application
    Close Application

*** Keywords ***

Click assessment
    click element       ${Assessment}

Capture assessment titles
    wait until element is visible            ${Assessment_titles}
    @{assessment_tabs}=     Get WebElements  ${Assessment_titles}
    @{subtabs}=             Get WebElements  ${Page_Data}
    :FOR   ${locator}   IN    @{assessment_tabs}
        \  ${name}=    Get Text    ${locator}
        \  log to console      ${name}
        \  click element          ${locator}
        \  sleep                  2
            :FOR   ${subtabs-data}    IN   @{subtabs}
            \      ${datagrab}=    Get Text    ${subtabs-data}
            \      sleep        2
            \      log to console      ${datagrab}
        \  sleep        2
        \




Close Application
    close browser

*** Variables ***

${Assessment}             xpath=//a[text()='Assessment']
${Assessment_titles}      xpath=//md-tab-item[@tabindex='-1']

#${Page_Data}             # xpath=//div[@class='tab-content assessment pv-pr10 pv-pl10']
#${Page_Data}              xpath=//md-tab-item[@tabindex='-1']
${Page_Data}              xpath=//div[@class='assessment-tab-details']
