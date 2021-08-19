*** Settings ***
Library    Screenshot
Library    SeleniumLibrary
Library    DateTime
*** Variables ***
${browser}    chrome
${url}  http://deviitbatest.ttssupport.info/
${loginpagetitle}   IIT BAA System LogIn
${username}     ishika@yopmail.com
${password}     Abc@1234
${academic_year}    2021-2022
${semester}     1st Year 1st Semester
${applicationFor}       Tution Fees
${amount}   50000
${docName}  Tution Fees
${applicationReason}    on that pandemic situation our family facing financial problems.
${applicationDetails}   I attached my semester tution fees document here. Please find it
*** Test Cases ***
Launch and Login the browser
    Set Screenshots Path
    Open the browser
    Goto Login page
*** Keywords ***
Set Screenshots Path
        ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
        set screenshot directory    ${date1}/
Screenshots ${scrName}
        Capture Page Screenshot     ${scrName}.png
Open the browser
        Open Browser   ${url}      ${browser}
        Maximize Browser Window
        title should be       ${loginpagetitle}
        Screenshots openBrowser
Goto Login page
        sleep   5
        click element     xpath://button[@class='frm_btn log-in-btn']
        sleep   2
        Screenshots loginButtonClick
        ${"user_txt"}     set variable     id:user_name
        element should be visible   ${"user_txt"}
        element should be enabled   ${"user_txt"}
        input text     ${"user_txt"}   ${username}
        sleep   2
        Screenshots afterUsernameEnter
        ${"password_txt"}     set variable     id:password
        element should be visible   ${"password_txt"}
        element should be enabled   ${"password_txt"}
        input text     ${"password_txt"}   ${password}
        sleep   2
        Screenshots afterPasswordEnter
        click button    xpath://button[@id='btn_login']
        sleep   2
        Screenshots afterLogin
        click element   xpath://body/div[1]/ul[1]/li[3]/a[1]/*[1]
        click link  xpath://a[contains(text(),'New Application')]
        sleep   2
        Screenshots newApplication
        select from list by label   academic_yr_id_cna     ${academic_year}
        sleep   2
        Screenshots academicYear
        select from list by label   ddlSemester_cna     ${semester}
        sleep   2
        Screenshots semester
        select from list by label   create_newapplication_type     ${applicationFor}
        sleep   2
        Screenshots applicationFor
        ${"amount_txt"}     set variable     id:amount_na
        element should be visible   ${"amount_txt"}
        element should be enabled   ${"amount_txt"}
        input text     ${"amount_txt"}   ${amount}
        sleep   2
        Screenshots afterAmountEnter
        ${"doc_name_txt"}     set variable     id:doc_name
        element should be visible   ${"doc_name_txt"}
        element should be enabled   ${"doc_name_txt"}
        input text     ${"doc_name_txt"}   ${docName}
        sleep   2
        Screenshots afterSupportingDocumentEnter
        ${"applicationReason_txt"}     set variable     id:Reason_for_Application_na
        element should be visible   ${"applicationReason_txt"}
        element should be enabled   ${"applicationReason_txt"}
        input text     ${"applicationReason_txt"}   ${applicationReason}
        sleep   2
        Screenshots afterApplicationReasonEnter
        ${"applicationDetails_txt"}     set variable     id:details_na
        element should be visible   ${"applicationDetails_txt"}
        element should be enabled   ${"applicationDetails_txt"}
        input text     ${"applicationDetails_txt"}   ${applicationDetails}
        sleep   2
        Screenshots afterApplicationDetailsEnter
        Select Checkbox     xpath://input[@id='checkbox1']
        Select Checkbox     xpath://input[@id='checkbox2']
        sleep   2
        click   button    xpath://button[@id='btn_submit_student_application_na']
        sleep   2
        Screenshots afterSubmitEnter




