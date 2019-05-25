*** Settings ***
Documentation    Before login the Website


*** Keywords ***

Open Browser and navigate to URL
    open browser   ${URL}   ${Browser}

Title of webPage
    ${curtitle}=        get title
    log to console      ${curtitle}
    should be equal     ${curtitle}     ${Title}

Click Login button to redirect
    click element      ${Login_link}


Login With Valid data
    input text       ${Login.Username}           anthony.admanstate
    input text       ${Login.Password}           mesabone
    click button     ${Login.Submit}

Move to Portal
    click element    ${Profile}
    sleep            ${sleep}
    click element    ${Portal}

Verify the link
    ${portal_link}=     get location
    log to console      ${portal_link}
    should be equal     ${portal_link}      https://www.pitchvision.com/#/hub


*** Variables ***
${URL}                        https://www.pitchvision.com
${Browser}                    Chrome
${Title}                      PitchVision - Live Local Matches | Cricket Tips & Techniques | Active Cricket Community

${Login_link}                 xpath=//a[text()='Log In']

${sleep}                      5

${Profile}                    xpath=//img[@ng-if='$root.profile_photo']
${Portal}                     xpath=//ul[@class='dropdown-menu dropdown-menu-right']/li[3]

${AllFeatures}                xpath=//div[@class='portal ng-isolate-scope']/div/div

&{Login}        Username=//form[@name='pvLoginform']/div/input[@name='username']
...             Password=//form[@name='pvLoginform']/div/input[@name='password']
...             Submit=//form[@name='pvLoginform']/div/input[@value='Log In']