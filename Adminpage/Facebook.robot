*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
#Test Teardown  close browser
#Suite Teardown  close browser

*** Test Cases ***
Check box verification
    open browser    ${URL}      ${Browser}
    Wait Until Page Contains Element     xpath=//label[contains(text(),'Email or Phone')]        10
    input text          xpath=//input[@id='email']      srihari
    Textfield Value Should Be       xpath=//input[@id='email']      srihari
    press key           //input[@id='pass']     TAB
    Select From List By Index       xpath=//select[@id='day']       2
 #   select from list by value       xpath=//select[@id='month']     12
    select from list by label       xpath=//select[@id='month']      Dec
    Open Context Menu               xpath=//select[@id='month']
    sleep                             5
    Set Window Size                 1700         800
    Page Should Contain Button          xpath=//input[@id='u_0_3']
#    Unselect From List By Label     xpath=//select[@id='month']      Dec

    ${title}=   get title
    Title Should Be     ${title}
    log source
    log location
    log variables
    Close All Browsers




*** Keywords ***
Provided precondition



*** Variables ***

${URL}          https://www.facebook.com
${Browser}      Chrome
