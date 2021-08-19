*** Settings ***
Library    Screenshot
Library    SeleniumLibrary
Library    DateTime
*** Variables ***
${browser}    chrome
${url}  http://deviitbatest.ttssupport.info/
${loginpagetitle}   IIT BAA System LogIn
${username}     support@tangenttechsolutions.com
${password}     Abc@1234
${remarks}      Good
${financial_year}       2020-2021
${interview_type}    Online
*** Test Cases ***
Launch and adminLogin the browser
    Set Screenshots Path
    Open The Browser
    Admin Login Page
    #New Application
    Shortlist Application And Interview Schedule
    Rejected Application
    Interview Schedule
    Approved
    Rejected From Interview
    Closed Application

*** Keywords ***
Set Screenshots Path
        ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
        set screenshot directory    ${date1}/

Screenshots ${scrName}
        Capture Page Screenshot     ${scrName}.png

Open The Browser
        Open Browser   ${url}      ${browser}
        Maximize Browser Window
        title should be       ${loginpagetitle}
        Screenshots openBrowser

Admin Login Page
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

New Application
        click element   xpath://body/div[1]/ul[1]/li[3]/a[1]
        click link  xpath://a[contains(text(),'View Application')]
        sleep   2
        Screenshots viewApplication
        click button    xpath://button[@id='searchBtn_NewApp']
        sleep   2
        Screenshots allNewApplication
        click element   xpath://tbody/tr[1]/td[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]
        sleep   3
        Screenshots firstAplicationSelect
        click element   xpath://tbody/tr[1]/td[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/ul[1]/li[1]/a[1]/button[1]
        sleep   5
        ${"remarks_txt"}    set variable    id:shotlistrescreeningmarks
        element should be visible   ${"remarks_txt"}
        element should be enabled   ${"remarks_txt"}
        input text  ${"remarks_txt"}    ${remarks}
        sleep   2
        Screenshots afterRemarks
        click button    xpath://button[@id='btn_shortlisted_Screened']
        sleep   2
        Screenshots afterShortlisted
        click button    xpath://button[contains(text(),'ok')]

Shortlist Applications And Interview Schedule
        click element   xpath://body/div[1]/ul[1]/li[3]/a[1]
        click link  xpath://a[contains(text(),'View Application')]
        sleep   2
        Screenshots viewApplication
        click element   xpath://li[contains(text(),'Shortlisted Application')]
        click button    xpath://button[@id='shortlistBtn']
        sleep   2
        Screenshots allShortlistedApplications
        click element   xpath://tbody/tr[1]/td[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]
        click element   xpath://tbody/tr[1]/td[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[2]/div[3]/div[1]/div[2]/ul[1]/li[1]/a[1]/button[1]
        sleep   2
        Screenshots addInterviewSchedule
        select from list by label   academic_shortlisted     ${financial_year}
        sleep   2
        Screenshots addFinancialYear
        click button    xpath://button[@id='scrhBtn']
        sleep   3
        Screenshots allShortlistedlistOfFinancialYear
        click link  xpath://a[contains(text(),'15')]
        select from list by label   ddl_interview     ${interview_type}
        sleep   2
        Screenshots afterInterviewType



