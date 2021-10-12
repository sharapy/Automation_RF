*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  https://reqres.in
${list_users}  /api/users


*** Test Cases ***
List_Users_by_page
    ${response}=  GET  ${base_url}${list_users}  params=page=2
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #Validations
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  Lindsay

    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    Should be equal  ${contentTypeValue}  application/json; charset=utf-8

Post_a_user
    [Tags]    kuchbhi
    create session  mysession  ${base_url}
    ${body}=  create dictionary  name=Shada1  job=automation
    log to console  ${body}
    ${resp}=  post on session  mysession  /api/users  json=${body}  expected_status=anything
    log to console  ${resp.status_code}
    log to console  ${resp.content}

    # Validation
    ${status_code}=  convert to string  ${resp.status_code}
    should be equal  ${status_code}  201

    ${res_body}=  convert to string  ${resp.content}
    should contain  ${res_body}  createdAt
    should contain  ${res_body}  id



