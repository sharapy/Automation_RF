*** Settings ***
Documentation    Suite description
Library  JSONLibrary
Library  os
Library  Collections

*** Variables ***
${base_url}  https://reqres.in


*** Test Cases ***
TC1: Json validation
    ${json_obj}  load json from file  C:\\Users\\Sharad\\Documents\\Code\\Automation_RF\\TestCases\\somejson.json
    ${name_value}  get value from json  ${json_obj}  $.firstname
    should be equal  ${name_value[0]}  john

    ${name_value}  get value from json  ${json_obj}  $.Address.StreetAddress
    should be equal  ${name_value[0]}  Al Mankhool, 21 3rd Street