*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  Collections



*** Test Cases ***
TC001 GET Rrquest
    create session   Get_Student_Details  ${base_url}
    ${response}=    get request    Get_Student_Details      api/studentsDetails
    log to console      ${response.status_code}
    log to console      ${response.content}

TC002 Fetch Student details by ID
    create session   FetchData  ${base_url}
    ${Response}=    get request    FetchData    api/studentsDetails/${StudentID}
    log to console      ${Response.status_code}
    should be equal as integers  ${Response.status_code}    200

TC004 Put data
    create session   AppData  ${base_url}
    &{body}=    create dictionary  first_name=Testing   middle_name=Naidu   last_name=Pudu      date_of_birth=12/12/1990
    &{header}=  create dictionary  Content-Type=application/json
    ${Response}=    post request    AppData    api/studentsDetails   data=${body}   headers=${header}
    ${code}=     convert to string  ${Response.status_code}
    should be equal     ${code}     201
    log to console  ${Response.content}


*** Keywords ***



*** Variables ***
${base_url}     http://thetestingworldapi.com
${StudentID}    28