*** Settings ***
Documentation    Verify the before login functionalities
Library          Selenium2Library
Library          Collections
Resource         ..//Tests/basic.robot
Suite Teardown  close browser

*** Test Cases ***
Start Application
    Open Browser and navigate to URL
    Title of webPage

Social Media links verification
    Facebook Link verification
    sleep           ${sleep}
    Twitter Link verification
    sleep           ${sleep}
    YouTube Link verification
    sleep           ${sleep}
    LinkedIn Link verification
    sleep           ${sleep}

Android Links verification
    Android Link Verification
    sleep           ${SLEEP}
IOS App Store link verification
    IOS Link Verification
    sleep           ${SLEEP}

All options PV bottom banner verifications
    Cricket Jobs Links verification
    Online courses verification
    Forum Link verification
    FQA Link verification
    Terms and conditions verifications
    sleep           ${sleep}

HomePage banners verifications
    1st Banner verification
    2nd Banner verification
    3rd Banner verification
    4th Banner verification


*** Keywords ***

Facebook Link verification
    click element               ${Facebook_Page}
    sleep                       4
    ${Facebook_Location}=   get location
    log to console      ${Facebook_Location}
    should be equal     ${Facebook_Location}        https://www.facebook.com/PitchVisionSports/
    go back

Twitter Link verification
    click element               ${Twitter}
    sleep                       4
    ${Twitter_Location}=   get location
    log to console      ${Twitter_Location}
    should be equal    ${Twitter_Location}        https://twitter.com/PitchVision
    go back

LinkedIn Link verification
    click element               ${LinkedIn}
    sleep                       4
    ${LinkedIn_Location}=   get location
    log to console      ${LinkedIn_Location}
    go back

YouTube Link verification
    click element               ${YouTube}
    sleep                       4
    ${YouTube_Location}=   get location
    log to console      ${YouTube_Location}
    should be equal     ${YouTube_Location}        https://www.youtube.com/channel/UCdwsUkZnqJ6i5qvbPhehfow
    go back


Android Link Verification
    click element               ${Android}
    sleep                       3
    select window       NEW
    ${Android_Location}=   get location
    log to console      ${Android_Location}
    should be equal     ${Android_Location}        https://play.google.com/store/apps/details?id=com.pitchvision
    select window       PitchVision - Live Local Matches | Cricket Tips & Techniques | Active Cricket Community


IOS Link Verification
    click element               ${IOS}
    sleep                       3
    select window       NEW
    ${IOS_Location}=   get location
    log to console      ${IOS_Location}
    should be equal     ${IOS_Location}        https://itunes.apple.com/in/app/pitchvision/id1047623988?mt=8
    select window       PitchVision - Live Local Matches | Cricket Tips & Techniques | Active Cricket Community


Cricket Jobs Links verification
    click element       ${CricketJobs}
    sleep                       3
    ${CricketJobs_Location}=   get location
    log to console      ${CricketJobs_Location}
    should be equal     ${CricketJobs_Location}         https://www.pitchvision.com/#/PVCricketJobs
    go back

Online courses verification
    click element       ${OnlineCourses}
    sleep                       3
    ${OnlineCourses_Location}=   get location
    log to console      ${OnlineCourses_Location}
    should be equal     ${OnlineCourses_Location}         https://www.pitchvision.com/cricket-coaching#/
    go back

Forum Link verification
    click element       ${Forum}
    sleep                       3
    ${Forum_Location}=   get location
    log to console      ${Forum_Location}
    should be equal     ${Forum_Location}         https://www.pitchvision.com/forum#/
    go back


FQA Link verification
    click element       ${FAQ}
    sleep                       3
    ${FQA_Location}=   get location
    log to console      ${FQA_Location}
    should be equal     ${FQA_Location}        https://www.pitchvision.com/faq#/
    go back

Terms and conditions verifications
    click element       ${TermsConditions}
    sleep                       3
    ${Terms_Location}=   get location
    log to console      ${Terms_Location}
    should be equal     ${Terms_Location}        https://www.pitchvision.com/terms_and_conditions.html
    go back

1st Banner verification
    click element       ${FirstBanner}
    sleep               4
    ${hight} =   Get Element Size        ${FirstBanner}
    ${width} =   Get Element Size        ${FirstBanner}
    log to console      ${hight}
    log to console      ${width}
    click element       ${Img1}
    ${cur_link1}=    get location
    log to console      ${cur_link1}
    should be equal     ${cur_link1}      https://www.pitchvision.com/#/pv-matches/sa-vs-pak-womens
    sleep               3
    go back


2nd Banner verification
    click element       ${Secondbanner}
    sleep               2
    click element       ${Img2}
    ${cur_link2}=    get location
    log to console      ${cur_link2}
    should be equal     ${cur_link2}      https://products.pitchvision.com/product/pv-match/
    sleep               3
    go back

3rd Banner verification
    click element       ${Thirdbanner}
    sleep               2
    click element       ${Img3}
    ${cur_link3}=    get location
    log to console      ${cur_link3}
    should be equal     ${cur_link3}      https://www.pitchvision.com/academy#/
    sleep               ${sleep}
    go back


4th Banner verification
    click element       ${ForthBanner}
    sleep               2
    click element       ${Img4}
    ${cur_link4}=    get location
    log to console      ${cur_link4}
    should be equal     ${cur_link4}      https://products.pitchvision.com/
    sleep               ${sleep}
    go back

*** Variables ***
${Facebook_Page}        xpath=//a[@class='sprite fb']
${Twitter}              xpath=//a[@class='sprite tw']
${LinkedIn}             xpath=//a[@class='sprite in']
${YouTube}              xpath=//a[@class='sprite yt']

${Android}              xpath=//div[@class='app-div']
${IOS}                  xpath=//div[@class='app-div ios-app-div']

${CricketJobs}          xpath=//span[contains(text(),'Cricket Jobs')]
${OnlineCourses}        xpath=//span[contains(text(),'Online Courses')]
${Forum}                xpath=//span[contains(text(),'Forum')]
${FAQ}                  xpath=//span[contains(text(),'FAQs')]
${TermsConditions}      xpath=//span[contains(text(),'Terms & Conditions')]



# Banners Verification
${FirstBanner}          xpath=//li[@class='active']
${Img1}                 xpath=//img[@src='images/redesign/banners/home-page-banner-4.jpg']
${Secondbanner}         xpath=//section[@class='top-banner']//li[2]
${Img2}                 xpath=//img[@src='images/redesign/banners/home-page-banner-3.jpg']
${Thirdbanner}          xpath=//section[@class='top-banner']//li[3]
${Img3}                 xpath=//img[@src='images/redesign/banners/home-page-banner-1.jpg']
${ForthBanner}          xpath=//section[@class='top-banner']//li[3]
${Img4}                 xpath=//img[@src='images/redesign/banners/home-page-banner-2.jpg']