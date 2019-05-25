*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary
Resource        ..//Tests/basic.robot



*** Test Cases ***

Open Application
    Open Browser and navigate to URL
    Title of webPage

Cricket match page checking
    Match_Page_text_verification
    Click on match page
    sleep          ${Sleep}
    Verify_All_Matches
    Verify_My_Matches
    sleep          ${Sleep}


Find the match link & Redirecting to the page
    Move to score card
    sleep           ${sleep}

Result Verification of the match
    Team-A-Score on the scorecard
#    Second team Team-B-Score
#    Status of the match verification
    Scorecard of team_A

Close the Application
    close browser



*** Keywords ***

Open Browser and navigate to URL
    open browser   ${URL}   ${Browser}

Title of webPage
    ${curtitle}=        get title
    log to console      ${curtitle}
    should be equal     ${curtitle}     ${Title}

Match_Page_text_verification
    ${Mat}=     get text    ${MatchPage}
    log to console          ${Mat}
    should be equal         ${Mat}         MATCHES

Click on match page
    click element           ${MatchPage}

Verify_All_Matches
    ${all}=     get text    ${All_Matches}
    log to console       ${all}
    should be equal      ${all}         All Matches

Verify_My_Matches
    ${My}=        get text    ${Live_matches}
    log to console       ${My}
    should be equal      ${My}          Live Matches

Move to score card
    click element   ${Score_card}
    select window   New
    ${match link}=     get location
    log to console      ${match link}

Team-A-Score on the scorecard
    ${a}=   get text    ${Team_A_Score}
    log to console      ${a}
    page should contain     KARACHI NORTH DOLPHIN
#
#Second team Team-B-Score
#    ${b}=   get text    ${Team_B_Score}
#    log to console      ${b}
#    page should contain     JUBILEE KINGS A
#
#Status of the match verification
#     ${s}=   get text    ${Staus_Of_Match}
#    log to console      ${s}
#    page should contain     ${s}

Scorecard of team_A
    ${A-Players}=     get text        ${TeamScorecard-A}
    log to console      ${A-Players}



*** Variables ***

${MatchPage}        xpath=//li[@class='header-menu-item live-matches-menu']//span[@class='sub-catg-tab'][contains(text(),'Matches')]

${All_Matches}      xpath=//li[@class='all-matches pv-live-tab active']

${Live_matches}     xpath=//li[@class='live-matches pv-live-tab']

${Score_card}       xpath=//div[@class='match-chart']//div[1]//div[1]//div[2]//a[1]//div[1]

${Team_A_Score}     xpath=//div[@class='team-data']

${Team_B_Score}     xpath=//div[@class='team-data team-data-b']

${Staus_Of_Match}   xpath=//span[@class='winner-info-text ng-binding']

${TeamScorecard-A}  xpath=//div[@class='team-name ng-binding'][contains(text(),'JUBILEE KINGS A')]
${TeamScorecard-B}  xpath=123




