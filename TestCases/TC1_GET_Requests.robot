*** Settings ***
Library  RequestsLibrary


*** Variables ***
${base_url}  http://reqres.in
${list_users}  /api/users


*** Test Cases ***
List_Users_by_page
    ${response}=  GET  ${base_url}${list_users}  params=page=2
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

