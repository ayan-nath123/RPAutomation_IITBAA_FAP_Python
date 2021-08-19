*** Settings ***
Library    Screenshot
Library    SeleniumLibrary
Library    DateTime
*** Variables ***
${browser}    chrome
${url}  http://deviitbatest.ttssupport.info/
${loginpagetitle}   IIT BAA System LogIn
${email}     arijit3.dutta@yopmail.com
${password}     Abc@1234
${fname}        A215ri662jit
${lname}        Dut211ta
${gender}       Male
${aadhar}       123456780456
${pan}          EOPPD0078C
${phone}        9547547603
*** Test Cases ***
Launch and Signin the browser
    Set Screenshots Path
    Open the browser
    Goto signin page

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
Goto signin page
        sleep   5
        click element     xpath://button[@class='frm_btn log-in-btn']
        sleep   2
        Screenshots loginButtonClick
        click link  xpath://a[contains(text(),'Sign Up')]
        sleep   2
        Screenshots signUpButtonClick
        click element       xpath://button[@id='btn_ldap_no']
        sleep   5
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots blankClickSubmit
        ${"email_txt"}     set variable     id:email_id_
        double click element    ${"email_txt"}
        element should be visible   ${"email_txt"}
        element should be enabled   ${"email_txt"}
        input text     ${"email_txt"}   ${email}
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterEmail
        ${"fname_txt"}     set variable     id:fname_
        element should be visible   ${"fname_txt"}
        element should be enabled   ${"fname_txt"}
        input text     ${"fname_txt"}   ${fname}
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterFname
        ${"lname_txt"}     set variable     id:lname_
        element should be visible   ${"lname_txt"}
        element should be enabled   ${"lname_txt"}
        input text     ${"lname_txt"}   ${lname}
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterLname
        select from list by label   gender_     ${gender}
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterGender
        ${"aadhar_txt"}     set variable     id:adhr_no_
        element should be visible   ${"aadhar_txt"}
        element should be enabled   ${"aadhar_txt"}
        input text     ${"aadhar_txt"}   ${aadhar}
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterAadhar
        ${"pan_txt"}     set variable     id:panNumber_
        element should be visible   ${"pan_txt"}
        element should be enabled   ${"pan_txt"}
        input text     ${"pan_txt"}   ${pan}
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterPan
        ${"phone_txt"}     set variable     id:PhnNumber_
        element should be visible   ${"phone_txt"}
        element should be enabled   ${"phone_txt"}
        input text     ${"phone_txt"}   ${phone}
        Screenshots afterEnterPhone
        sleep   2
        click button     xpath://button[@id='btnGOsignup']
        sleep   5
        Screenshots afterEnterSubmit


