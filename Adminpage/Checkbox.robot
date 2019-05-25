*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Test Teardown  close browser
Suite Teardown  close browser

*** Test Cases ***
Check box verification
    open browser    ${URL}      ${Browser}
    set selenium implicit wait          5 seconds
    checkbox should be selected          xpath=//div[@class='example']/form/input[2]
    checkbox should not be selected      xpath=//div[@class='example']/form/input[1]
    select checkbox                      xpath=//div[@class='example']/form/input[1]
    unselect checkbox                    xpath=//div[@class='example']/form/input[2]
    go to                                http://the-internet.herokuapp.com/key_presses
    press keys                           //p[@id='result']           CTRL
    sleep                                10
    close browser
    close all browsers


*** Keywords ***
Provided precondition



*** Variables ***

${URL}          http://the-internet.herokuapp.com/checkboxes
${Browser}      Chrome
