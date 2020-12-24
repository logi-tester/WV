*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Library           DateTime
Library           BuiltIn

*** Variables ***
${baseurl}        https://uat.worldvision.in/
${browser}        chrome
${rightside_menu_list}    7
${postlogin_menu_list}    6
${edu_child_amt}    4000
${val}            000
${hunger_free_camp_amt}    1000
${hunger_camp_name_space}    Free
${user_name}      9600185121
${password}       123456
${addon_val}      100
${real_gift_enter_val}    1000
${checkout_payment_list_no}    4
@{Sponcer_List}    Educate Children    HIV & AIDS    End Child Sexual Abuse    Childhood Rescue    Save Malnourished Children    Educate Children    HIV & AIDS    End Child Sexual Abuse    Childhood Rescue    Save Malnourished Children
@{homepage_header_menu_txt}    About Us    Child Sponsorship    Ways to Give    Get Involved    Partnerships    Media
@{checkout_payment_list_text}    Powered by CC Avenue    Powered by AXIS BANK    POWERED BY HDFC BANK
@{SI_payment_list_text}    NET BANKING    Indian credit card    Debit card
@{checkout_payment_list_ind_passport}    Debit Card/Net banking/Wallets/Amex    Amazon Pay    International credit card    Indian credit cards    Offline Payment
@{postlogin_homepage_header_menu_txt_list}    My World    My Child    My Campaign    Tax Receipts    Ways to Give    Explore More
@{postlogin_homepage_header_chck_menu_txt}    My World    My Child    My Campaign    Tax Receipts    Ways to Give    Explore More
@{Aboutus_submenu_txt}    Who We Are    How We Work    Where We Work    Our History    Our Accountability    Careers    Contact Us
@{Childsponsorship_submenu_txt}    How Sponsorship Works    Sponsor a Child    Stories of Change    Partners Speak    FAQs    Child Protection Policy
@{Ways_to_give}    Overview    HoSh - Hope to Shine    Back to School    Gift Catalogue    Educate Children    Emergency Relief    HIV & AIDS    Hungerfree    End Child Sexual Abuse    Childhood Rescue    Save Malnourished Children    Where Most Needed
@{Get_involved}    Events    Volunteer
@{Media_submenu_txt}    Press Releases    News Articles    Blog    Publication
@{Partnership_submenu_txt}    Corporate
@{post_login_my_world_submenu_txt}
@{post_login_waysto_give}    Overview    HoSh - Hope to Shine    Back to School    Gift Catalogue    Educate Children    Emergency Relief    HIV & AIDS    Hungerfree    End Child Sexual Abuse    Childhood Rescue    Save Malnourished Children    Where Most Needed
${banner_failure_txt}    Sorry, your previous transaction has not gone through

*** Test Cases ***
Verify user should able to save the profile without entering any Mandatory details
    [Tags]    My Profile
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//span[@class='Sub_head_Login']
    Click Element    //input[@id='edit-name']
    Input Text    //input[@id='edit-name']    logimohan@gmail.com
    Click Element    //input[@id='edit-pass']
    Input Password    //input[@id='edit-pass']    logi
    Click Element    //button[text()='Login']
    Click Element    //li[@class='welcomesponsor']
    Click Link    //a[@href="/user"]
    Click Element    //a[text()='Edit Profile']
    #Clear Field
    Clear Element Text    //input[@id='edit-field-first-name-0-value']
    Clear Element Text    //input[@id='edit-field-last-name-0-value']
    Clear Element Text    //input[@id='edit-field-registeraddress-0-value']
    Clear Element Text    //input[@id='edit-field-address-2-0-value']
    Clear Element Text    //input[@id='edit-field-pin-code-0-value']
    Clear Element Text    //input[@id='edit-mail']
    Click Element    edit-submit
    #Check Alert
    #first name alert
    ${firstname_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-first-name-0-value-error
    Run Keyword If    'True'!='${firstname_alert}'    Fail    "First name alert not display"
    #last name alert
    ${lastname_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-last-name-0-value-error
    #adddress 1 alert
    ${addrs_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-registeraddress-0-value-error
    Run Keyword If    'True'!='${addrs_alert}'    Fail    "Address 1 alert not display"
    #adddress 2 alert
    ${addrs2_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-last-name-0-value-error
    Run Keyword If    'True'!='${addrs2_alert}'    Fail    "Address 2 alert not display"
    #Postal code alert
    ${postal_code}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-pin-code-0-value-error
    Run Keyword If    'True'!='${postal_code}'    Fail    "Postal code alert not display"
    #Email alert
    ${email_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-mail-error
    Run Keyword If    'True'!='${email_alert}'    Fail    "Email address alert not display"

To register > User should fill all the required fields and click "create new account" button
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Register')]
    #first name
    Input Text    id=edit-field-first-name-0-value    logeshwari
    #last name
    Input Text    id=edit-field-last-name-0-value    mohan
    #Email
    Input Text    id=edit-mail    logi@gmail.com
    #Phone no
    Input Text    id=edit-field-mobile-verify-0-mobile    9345623456
    #confirm password
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[text()='Password']    
    Input Text    id=edit-pass-pass1    logi
    #Re-confirm
    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[text()='Confirm Password']
    Input Text    id=edit-pass-pass2    logi
    #Address 1
    Input Text    id=edit-field-registeraddress-0-value    ngkdjdfhbdjkgh
    #Address 2
    Input Text    id=edit-field-address-2-0-value    lkjlhdfgldjfgjhg
    #Address 3
    Input Text    id=edit-field-address-3-0-value    lkjlhdfgldjfgkljuytr
    #Postal code
    Input Text    id=edit-field-pin-code-0-value    600099
    #How Do you Know - Newly added
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    id=edit-field-how-do-you-know-about-worl    Friends and Family        
    #DOB
    Click Element    //label[text()='Date of Birth']
    Select From List By Label    xpath=//select[@class='ui-datepicker-month']    Sep
    Select From List By Label    xpath=//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=(//table//tbody/tr/td/a)[7]
    Click Element    //button[@class='singUpRegister']
    #${chck_reg_worked}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='modal-content']
    #Run Keyword If    'True'!='${chck_reg_worked}'    Fail    "Register required fields are filled but OTP dialogue box not display"
    
Verify User should able to edit profile with invalid data
    [Tags]    My Profile
    #Local browser launch
    Jenkins browser launch
    # Click Login icon in Header
    Click Element    xpath=//span[@class='Sub_head_Login']
    # Enter Email-Id or Ph no
    Click Element    //input[@id='edit-name']
    Input Text    //input[@id='edit-name']    logimohan@gmail.com
    # Enter the Password
    Click Element    //input[@id='edit-pass']
    Input Password    //input[@id='edit-pass']    logi
    Click Element    //button[text()='Login']
    # Click Welcome Button
    Click Element    //li[@class='welcomesponsor']
    # Click My Profile
    Click Link    //a[@href="/user"]
    # Click Edit Profile
    Click Element    //a[text()='Edit Profile']
    # Edit pan Number
    Input Text    //input[@id='edit-field-pan-number-0-value']    BJTPB90$@AA
    # Enter valid PAN Number.
    ${get_invalid_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//strong[@id='edit-field-pan-0-value-error']
    Run Keyword If    'True'!='${get_invalid_alert}'    Fail    "Enter invalid PAN number, alert is not display"

Click login link
    [Tags]    LOGIN
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    ${check_login_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//*[@class='login-form__top']
    Run Keyword If    'True'!='${check_login_page}'    Fail    "When click login icon it will not redirect to login page"

To verify Login credentials in UPPER case should not be treated as invalid
    [Tags]    LOGIN
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    //input[@id='edit-name']
    Input Text    //input[@id='edit-name']    LOGIMOHAN@GMAIL.COM
    Click Element    //input[@id='edit-pass']
    Input Password    //input[@id='edit-pass']    logi
    Click Element    //button[text()='Login']
    ${chck_redirect_userlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='welcomesponsor']
    Run Keyword If    'True'=='${chck_redirect_userlogin_page}'    Log To Console    "Login credentials are given in Uppercase and Page redirected to post Login page"
    #${chck_invalid_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='InvalidUsername']
    #Run Keyword If    'True'=='${chck_invalid_alert}'    Fail    "Login credentials are given in Uppercase but alert msg are display"
    #${chck_redirect_userlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='welcomesponsor']
    #Run Keyword If    'True'!='${chck_redirect_userlogin_page}'    Fail    "Login credentials are given in Uppercase but it will not redirect to the postlogin page"

Validation message should be shown when invalid username and/or password is enter
    [Tags]    LOGIN
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    logi
    Click Element    id=edit-pass
    Input Text    id=edit-pass    logi
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${invalid_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${invalid_alert}'    Fail    "Enter invalid username and password 'Incorrect username or password' error msg not display"

After clicking get one time OTP button
    [Tags]    LOGIN
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    logimohan@gmail.com
    Click Element    id=edit-pass
    Input Text    id=edit-pass    logi
    Click Element    id=ToGetOTP
    ${get_alert_txt}=    Get Text    xpath=.//span[@class='orngClr']
    Run Keyword If    'OTP has been sent to your Mobile/Email'!='${get_alert_txt}'    Fail    "When click 'Get One Time PAssword' link, alert msg not display"

To verify all the fields are mandy
    [Tags]    Registration Page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Register')]    
    Click Element    xpath=//div[@id='edit-actions']//button[@class='singUpRegister']   
    
    #first name alert
    Wait Until Page Contains Element    id=signUpfnameErr    15s
    ${firstname_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpfnameErr
    Run Keyword If    'True'!='${firstname_alert}'    Fail    "First name alert not display"
    
    #last name alert
    ${lastname_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUplnameErr
    Run Keyword If    'True'!='${lastname_alert}'    Fail    "Last name alert not display"
    #Email alert   
    
    ${email_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpEmailErr
    Run Keyword If    'True'!='${email_alert}'    Fail    "Email address alert not display"
    
    #Phone no alert
    ${phone_no__alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPhoneErr
    Run Keyword If    'True'!='${phone_no__alert}'    Fail    "Phone no alert not display"
    
    #Confirm password alert
    ${confirm_password_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpPassErr
    Run Keyword If    'True'!='${confirm_password_alert}'    Fail    "Confirm password alert not display"
    
    #Re-Confirm password alert
    ${reconfirm_password_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpConPassErr
    Run Keyword If    'True'!='${reconfirm_password_alert}'    Fail    "Re-Confirm password alert not display"
    
    #adddress 1 alert
    ${addrs_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpaddrErr
    Run Keyword If    'True'!='${addrs_alert}'    Fail    "Address 1 alert not display"
    
    #adddress 2 alert
    ${addrs2_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpaddrErr1
    Run Keyword If    'True'!='${addrs2_alert}'    Fail    "Address 2 alert not display"
    
    #adddress 3 alert - NEWLY ADDED
    ${addrs3_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpaddrErr3
    Run Keyword If    'True'!='${addrs3_alert}'    Fail    "Address 2 alert not display"

    #Postal code alert
    ${postal_code}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpPscodeErr
    Run Keyword If    'True'!='${postal_code}'    Fail    "Postal code alert not display"
    
    #City alert
    ${city_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpCityErr
    Run Keyword If    'True'!='${city_alert}'    Fail    "City alert not display"
    
    #State alert
    ${state_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpStateErr
    Run Keyword If    'True'!='${state_alert}'    Fail    "State alert not display"

To verify login through invalid mobile number with invalid password
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    9856787656
    Click Element    id=edit-pass
    Input Text    id=edit-pass    djfkdfjfk
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter Invalid mobile number and invalid password, 'Incorrect username or password' error msg not display"

To verify login through invalid email id and invalid password
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    mnvfdfa@gmail.com
    Click Element    id=edit-pass
    Input Text    id=edit-pass    djfkdfjfk
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter Invalid email id and invalid password, 'Incorrect username or password' error msg not display"

To verify login through invalid mobile number with valid password
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    9845674321
    Click Element    id=edit-pass
    Input Text    id=edit-pass    123456
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter Invalid mobile number and valid password, 'Incorrect username or password' error msg not display"

To verify login through valid mobile number with invalid password
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    9600185121
    Click Element    id=edit-pass
    Input Text    id=edit-pass    dfgdfs
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter valid mobile number and invalid password, 'Incorrect username or password' error msg not display"

To verify login through valid mobile number with valid password
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    9600185121
    Click Element    id=edit-pass
    Input Text    id=edit-pass    123456
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${postlogin_homepage_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='welcomesponsor']
    Run Keyword If    'True'!='${postlogin_homepage_chck}'    Fail    "Valid user can't able to login"

To verify login through valid email ID with valid password
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    logimohan@gmail.com
    Click Element    id=edit-pass
    Input Text    id=edit-pass    logi
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${postlogin_homepage_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='welcomesponsor']
    Run Keyword If    'True'!='${postlogin_homepage_chck}'    Fail    "Valid user can't able to login"

To Sponsor a child by SI payment flow from search page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//span[@class='Sub_head_search']
    Input Text    id=edit-search-api-fulltext    hjfhjhf
    Click Element    id=edit-submit-wv-custom-search
    ${search_child_count}=    Get Element Count    xpath=.//div[@class='search-page']
    Run Keyword If    4!=${search_child_count}    Fail    "Enter irrelavent data list of 4 child list not display"
    Mouse Over    xpath=(.//div[@class='search-page']/div[@class='search-page-childimg test']/h4)[1]
    Click Element    xpath=(.//div[@class='add-cart-btn'])[1]

Switching indian citizen to other passport holder in my profile page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    
    Wait Until Element Is Visible    id=edit-name    15s
    Click Element    id=edit-name    
    Input Text    id=edit-name    9600185121
    
    Wait Until Element Is Visible    id=edit-pass    15s
    Click Element    id=edit-pass    
    Input Text    id=edit-pass    123456
    
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My profile')]
    Click Element    xpath=.//a[contains(.,'Edit Profile')]
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    ${ind}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    Log To Console    Indian is choosed:${ind}
    Run Keyword If    'True'!='${ind}'    Fail    "Kumaran user by default have choosed 'Indian' but now it display like 'Other passport' holder"
    Click Element    xpath=.//label[@for='othctzn']
    Scroll Element Into View    id=edit-submit
    Click Element    id=edit-submit
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${val_1}    ${val_2}    Checkout flow campaign
    check in view cart page    ${val_1}    ${val_2}
    View cart proceed button
    ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    3!=${checkout_payment_list}    Fail    "Checkout flow Other passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Other passport holder Payment Gateway ${bank_txt} text is mismatch'
    END
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My profile')]
    Click Element    xpath=.//a[contains(.,'Edit Profile')]
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    Click Element    xpath=.//label[@for='indctzn']
    Scroll Element Into View    id=edit-submit
    Click Element    id=edit-submit
    
Valid username Invalid password
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    ${user_name}
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter valid username and blank password but 'Password/OTP is required.' error msg not display"
    Clear Element Text    id=edit-name

Invalid username and valid password
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-pass
    Input Text    id=edit-pass    ${password}
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//*[@id='edit-pass-error']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter valid password and blank username but 'Incorrect username or password' error msg not display"
    Clear Element Text    id=edit-pass

Ensure user can able to logout in direct login
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'Logout')]
    
    #Click Element    class=input-survey    
    #Input Text    input-survey    Test review Data
    #Click Element    class=btnSub-survey
    
    Click Element    class=close-survey            

    ${check_success_logout}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='pre_lgn']
    Run Keyword If    'True'!='${check_success_logout}'    Fail    "Site not getting proper logout"
    
Direct login with exit user
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    ${user_name}
    Click Element    id=edit-pass
    Input Text    id=edit-pass    ${password}
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${postlogin_homepage_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='welcomesponsor']
    Run Keyword If    'True'!='${postlogin_homepage_chck}'    Fail    "Exist user can't able to login for direct login"

Checkoutflow login with exit user
    #Local browser launch
    Jenkins browser launch
    One time Hunger Free campaign
    View cart proceed button
    Login
    ${checkoutflow_postlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']
    Run Keyword If    'True'!='${checkoutflow_postlogin_page}'    Fail    "Exist user can't able to login for Checkout Flow"
    
SI flow login with exit user
    #Local browser launch
    Jenkins browser launch
    Rescue child campaign
    SI login
    ${check_SI_postlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//form[@class='payment_selection_form']
    Run Keyword If    'True'!='${check_SI_postlogin_page}'    Fail    "Exist user can't able to login for SI Flow"    
 
To verify child rotator
    #Local browser launch
    Jenkins browser launch
    ${get_child_count}=    Get Element Count    xpath=.//*[@class='child_sponsor_image']/img
    Run Keyword If    ${get_child_count}<5    Fail    In home page child rotator child are display lessthen 5
    Check allow auto debit select default in child rotator
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    Click Element    xpath=//div[@class='item active']//button[@class='btn btn-primary si_modal_btn']
    ${check_sI_login_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='smartwizard']
    Run Keyword If    True!=${check_sI_login_page}    Fail    "When try to select child get into SI login but SI login page not display"
    Click Element    xpath=.//div[@class='modal-footer']/button
    9600 should select defaulty
    Check rounded checkbox txt and amount
    ${check_sel_child}=    Add child to view cart
    Child duplicate checking    ${check_sel_child}
 
To verify search child and donate
    #Local browser launch
    Jenkins browser launch
    Sleep    15s
    #Execute Javascript    window.scrollTo(0, 600)
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='container carousel_Sponsor defaultHead']
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${child_name}=    Get Text    xpath=.//div[@class='item active']//h4
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active']//p[@class='pricemnth active']//span[@class='home-price']
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Log To Console    Child name:${child_name} and child amount:${sel_child_amt} and also child img src:${sel_child_imgsrc}
    Click Element    xpath=.//div[@class='item active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active']//input[@id='edit-submit--12']    value
    Run Keyword If    'SPONSOR NOW'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active']//input[@id='edit-submit--12']
    ${child_sponsor_msg}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${child_sponsor_msg}'!='Success !'    Fail    "After child selected 'Sponsor Successfull' text not display"
    ${Sponsor_success_img_chck}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Run Keyword If    '${Sponsor_success_img_chck}'!='${sel_child_imgsrc}'    Fail    "Footer selected child and sponsor successs child image are not match"
    Click Element    xpath=//a[@class='view_cart']
    ${chck_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${child_name}')]
    Run Keyword If    'True'!='${chck_child_name}'    Fail    "Choosed child not display in view cart page"
    ${chck_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${sel_child_amt}')]
    Run Keyword If    'True'!='${chck_child_amt}'    Fail    "Choosed child amount are mismatch in view cart page"
    View cart proceed button
    Login
    CCavenue payment success flow
    Click Element    xpath=.//li[@class='post_lgn']/a
    Click Element    xpath=.//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]
    Click Element    xpath=.//div[@class='tog-top-sec']/ul/li[contains(.,'My Child')]n
    ${check_child_display}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='chld-items itm-sltn-add']//div[@class='cld-nme']/p[contains(.,'${child_name}')]
    Run Keyword If    True!=${check_child_display}    Fail    Payment success child not display in My Child

To verify child was donated in between gap while user seraching
    #Local browser launch
    Jenkins browser launch
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='container carousel_Sponsor defaultHead']
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${child_name}=    Get Text    xpath=.//div[@class='item active']//h4
    Log To Console    Child name:${child_name}
    Click Element    xpath=.//div[@class='item active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active']//input[@id='edit-submit--12']    value
    Run Keyword If    'SPONSOR NOW'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active']//input[@id='edit-submit--12']
    ${child_count}=    Get Element Count    xpath=.//div[@class='seach-page-hover-content']/h4
    FOR    ${index}    IN RANGE    1    ${child_count}
    ${chck_sel_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(.//div[@class='seach-page-hover-content']/h4[contains(.,'${child_name}')])[${index}]
    Run Keyword If    True==${chck_sel_child_name}    Fail    Selected child name is displayed in search page

Payment failure banner
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${val_1}    ${val_2}    Checkout flow campaign
    check in view cart page    ${val_1}    ${val_2}
    View cart proceed button
    Login
    CCAvenue payment failure flow
    Click Element    xpath=(.//a[@class='site-branding-logo'])[1]
    Payment failure check in home page banner
    
To sponsor a Educate Children Campaign using Checkout flow
    #Local browser launch    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${val_1}    ${val_2}    Checkout flow campaign
    check in view cart page    ${val_1}    ${val_2}
    View cart proceed button
    Login
    CCavenue payment success flow

To sponsor a Save Malnourished Children Campaign using Checkout flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Save Malnourished Children
    Sleep    5s
    ${val_1}    ${val_2}    Checkout flow campaign
    check in view cart page    ${val_1}    ${val_2}
    View cart proceed button
    Login
    CCavenue payment success flow
    
To sponsor a Childhood Rescue Campaign using Checkout flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Childhood Rescue
    Sleep    5s
    ${val_1}    ${val_2}    Checkout flow campaign
    check in view cart page    ${val_1}    ${val_2}
    View cart proceed button
    Login
    CCavenue payment success flow

To sponsor a Hunger Free Campaign as a one time donation using Checkout flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    One time Hunger Free campaign
    View cart proceed button
    Login
    CCavenue payment success flow

To sponsor a Where Most Needed Campaign as a one time donation using Checkout flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Where Most Needed
    ${camp_name}    ${Camp_val}    one time campaign
    check in view cart page    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow

To sposor a Educate Children Campaign as a one time donation using Checkout flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Educate Children
    ${camp_name}    ${Camp_val}    one time campaign
    check in view cart page    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow

To sponsor a Rescue Children Campaign using Si payment Flow from Educate Children campaign page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Childhood Rescue
    SI flow campaign
    SI login

To sponsor a Help HIV aids Campaign using Si payment Flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    HIV & AIDS
    SI flow campaign
    SI login

To sponsor a Protect Girl Children Campaign using Si payment Flow from Educate Children campaign page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    End Child Sexual Abuse
    SI flow campaign
    SI login

To sponsor child using SI flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Sleep    10s
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='container carousel_Sponsor defaultHead']
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${child_name}=    Get Text    xpath=.//div[@class='item active']//h4
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active']//p[@class='pricemnth active']//span[@class='home-price']
    ${remove_comma_symbol}=    Remove symbol    ${sel_child_amt}    ,
    ${remove_dollor_symbol}=    Remove symbol    ${remove_comma_symbol}    ₹
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Log To Console    Child name:${child_name} and child amount:${remove_dollor_symbol} and also child img src:${sel_child_imgsrc}
    Click Element    xpath=//div[@class='item active']//button[@class='btn btn-primary si_modal_btn']
    SI login
    ${SI_payment_total_amt}=    Get Text    xpath=.//h5[@id='TotalAmtOfOrder']
    ${get_amt_only}=    Fetch From Right    ${SI_payment_total_amt}    Total Amount Of Order
    Log To Console    Amount with INR output is:${get_amt_only}
    ${final_val}=    Fetch From Left    ${get_amt_only}    INR
    ${final_output}=    Strip String    ${SPACE}${final_val}
    Log To Console    Final val is:${final_output}
    Run Keyword If    ${final_output}!=${remove_dollor_symbol}    Fail    Selected amount and display amount in SI payment are mismatch
    ${check_SI_postlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//form[@class='payment_selection_form']
    Run Keyword If    'True'!='${check_SI_postlogin_page}'    Fail    "SI post login page not display"
    ${SI_payment_list}=    Get Element Count    xpath=.//div[@class='payment-main-content']/div
    Run Keyword If    3!=${SI_payment_list}    Fail    "SI Flow payment gateway list mismatch"
    FOR    ${SI_payment_txt}    IN    @{SI_payment_list_text}
        ${SI_payment_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-main-content']/div[contains(.,'${SI_payment_txt}')]
        Run Keyword If    'True'!='${SI_payment_txt_chck}'    Fail    "SI flow payment gateway ${SI_payment_txt} text are mismatch"
    END
    
Just post login check hungerfree campaign
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=.//li[@class='post_lgn']/a
    Click Element    xpath=.//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]
    Click Element    xpath=.//div[@class='tog-top-sec']/ul/li[contains(.,'My Donations')]
    ${hunger_free_label_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]
    Run Keyword If    'True'!='${hunger_free_label_chck}'    Fail    "Hunger free label not found"
    #${Hungerfree_label_amt}=    Run Keyword If    'True'=='${hunger_free_label_chck}'    Get Text    xpath=.//div[@class='chld-items    ']//div[@class='cld-nme']/p[contains(.,'Hunger Free')]/parent::div/following-sibling::div/p[1]
    ${Hungerfree_label_amt}=    Get Text    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]/parent::div/following-sibling::div/p[1]
    ${split_amt_label}=    Fetch From Right    ${Hungerfree_label_amt}    Amount Paid : ₹
    ${final_label_amt}=    Strip String    ${SPACE}${split_amt_label}
    Log To Console    Before hunger free label amount:${final_label_amt}
    Mouse Over    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Hungerfree')])[1]
    Click Element    xpath=.//div[@class='add-to-cart-section']
    ${hunger_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${split_Hunger_name_with_rightside}=    Split String From Right    ${hunger_camp_name}    ${EMPTY}
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='manualCart[0][amount]']    value
    Log To Console    Hunger campaign get input amount:${get_input_val}
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
    Click Element    xpath=//a[@class='view_cart']
    ${hunger_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${split_Hunger_name_with_rightside}[0]')]
    Run Keyword If    'True'!='${hunger_camp_viewcart}'    Fail    "Hunger Free campaign not display in view cart page"
    ${replace_val}=    Replace String    ${get_input_val}    1    1,
    ${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${replace_val}')]
    Run Keyword If    'True'!='${hunger_camp_amt_viewcart}'    Fail    "Hunger Free campaign amount are not display/mismatch in view cart page"
    View cart proceed button
    CCavenue payment success flow
    Click Element    xpath=.//li[@class='post_lgn']/a
    Click Element    xpath=.//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]
    Click Element    xpath=.//div[@class='tog-top-sec']/ul/li[contains(.,'My Donations')]
    ${hunger_free_label_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]
    Run Keyword If    'True'!='${hunger_free_label_chck}'    Fail    "Hunger free label not display"
    ${add_label_amt+input_amt}=    Evaluate    ${final_label_amt}+${get_input_val}
    Log To Console    Before hunger label amount + hunger free input value:${add_label_amt+input_amt}
    ${get_hungerfree_amt}=    Get Text    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]/parent::div/following-sibling::div/p[1]
    ${get_split_label_amt}=    Fetch From Right    ${get_hungerfree_amt}    Amount Paid : ₹
    ${get_final_amt}=    Strip String    ${SPACE}${get_split_label_amt}
    Log To Console    Overall hunger free label amount:${get_final_amt}
    Run Keyword If    ${add_label_amt+input_amt}!=${get_final_amt}    Fail    "After success Hunger free campaign recent amount not added in label"

Just pre login check hungerfree campaign
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=.//li[@class='post_lgn']/a
    Click Element    xpath=.//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]
    Click Element    xpath=.//div[@class='tog-top-sec']/ul/li[contains(.,'My Donations')]
    ${hunger_free_label_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]
    ${Hungerfree_label_amt}=    Get Text    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]/parent::div/following-sibling::div/p[1]
    ${split_amt_label}=    Fetch From Right    ${Hungerfree_label_amt}    Amount Paid : ₹
    ${final_label_amt}=    Strip String    ${SPACE}${split_amt_label}
    Log To Console    Before hunger free label amount:${final_label_amt}
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'Logout')]
    ${check_success_logout}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='pre_lgn']
    Run Keyword If    'True'!='${check_success_logout}'    Fail    "Site not getting proper logout"
    ${hunger_get_input_val}=    One time Hunger Free campaign
    Log To Console    Hunger campaign get input amount:${hunger_get_input_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    Click Element    xpath=.//li[@class='post_lgn']/a
    Click Element    xpath=.//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]
    Click Element    xpath=.//div[@class='tog-top-sec']/ul/li[contains(.,'My Donations')]
    ${hunger_free_label_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]
    Run Keyword If    'True'!='${hunger_free_label_chck}'    Fail    "Hunger free label not display"
    ${add_label_amt+input_amt}=    Evaluate    ${final_label_amt}+${hunger_get_input_val}
    Log To Console    Before hunger label amount + hunger free input value:${add_label_amt+input_amt}
    ${get_hungerfree_amt}=    Get Text    xpath=.//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Hunger Free')]/parent::div/following-sibling::div/p[1]
    ${get_split_label_amt}=    Fetch From Right    ${get_hungerfree_amt}    Amount Paid : ₹
    ${get_final_amt}=    Strip String    ${SPACE}${get_split_label_amt}
    Log To Console    Overall final hunger free label val:${get_final_amt}
    Run Keyword If    ${add_label_amt+input_amt}!=${get_final_amt}    Fail    "After success Hunger free campaign recent amount not added in label"

Tax receipt page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=.//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li/a[contains(.,'Tax Receipts')]
    ${chk_disable_download_Btn}=    Run Keyword And Return Status    Click Element    xpath=.//a[@class='downloadpdf']
    Run Keyword If    'True'!='${chk_disable_download_Btn}'    Fail    "Tax receipts page by default 'Download Tax Receipt' button is enable"
    Click Element    xpath=.//input[@id='edit-created-min']
    Select From List By Label    xpath=.//select[@class='ui-datepicker-month']    Jan
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    2020
    ${get_date_count}=    Get Element Count    xpath=//table[@class='ui-datepicker-calendar']//tbody/tr/td/a
    FOR    ${index}    IN RANGE    1    ${get_date_count}
        ${get_date_txt}=    Get Text    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        ${sub_date_}=    Subtract date
        Run Keyword If    '${get_date_txt}'=='${sub_date_}'    Click Element    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        Exit For Loop If    '${get_date_txt}'=='${sub_date_}'
    END
    Click Element    xpath=.//input[@id='edit-created-max']
    ${get_count_date}=    Get Element Count    xpath=//table[@class='ui-datepicker-calendar']//tbody/tr/td/a
    FOR    ${index}    IN RANGE    1    ${get_count_date}
        ${get_txt_date}=    Get Text    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        ${today_date}=    Today date
        Run Keyword If    '${get_txt_date}'=='${today_date}'    Click Element    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index_today}]
        Exit For Loop If    '${get_txt_date}'=='${today_date}'
    END
    Click Element    id=generate_tax
    
Hungree one time campaign
    #Local browser launch
    Jenkins browser launch
    One time Hunger Free campaign
    Delete view cart campaign
    
Educate children campaign
    #Local browser launch
    Jenkins browser launch
    Educate children campaign with checkout flow
    Delete view cart campaign
    
Logo and home page banner loaded check
    #Local browser launch
    Jenkins browser launch
    Element Should Be Visible    xpath=.//div[@class='header_new_logo']/div/a/img
    Sleep    4s
    ${check_homepag_banner_section_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[@class='slideshow_content area wv-pos-relative']/div[1]/div)[1]/div/div[@class='gavias_sliderlayer rev_slider_wrapper fullwidthbanner-container']
    Run Keyword If    'True'!='${check_homepag_banner_section_status}'    Fail    "Home page banner section not display properly"

Header main menu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//*[@class='we-megamenu-nolink' or text()=' My World ']
    Log To Console    ${headermenu_list}    
    Run Keyword If    '${headermenu_list}'!='${rightside_menu_list}'    Fail    "Header menu list size are mismatch"
    ${myworld_menus_name}=    Get Text    xpath=//div[@class='main-menu-inner']//li/a[contains(text(),'My World')]
    Run Keyword If    '${myworld_menus_name}'!='MY WORLD'    Fail    "My world menu text are different"
    FOR    ${menu_txt}    IN    @{homepage_header_menu_txt}
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//*[@class='we-megamenu-nolink' and contains(text(),'${menu_txt}') or contains(text(),'My World')]
        #${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin home page ${menu_txt} text are mismatch"
    END

Search
    Jenkins browser launch
    Click Element    xpath=.//span[@class='Sub_head_search']
    Input Text    id=edit-search-api-fulltext    ksngjdsnfjksdfj
    Click Element    id=edit-submit-wv-custom-search
    ${search_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//h3[@class='wv_sugg_search']
    Run Keyword If    'True'!='${search_status}'    Fail    "When enter irrelevant data 'No Result Found' text not display"
    

Header and footer verification
    Jenkins browser launch
    Element Should Be Visible    xpath=.//header[@id='header']
    Sleep    4s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Element Should Be Visible    xpath=.//footer
    
Aboutus submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//span[contains(text(),'About Us')]//parent::li//li/a
    #${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'About Us')]/div//ul/li
    Log To Console    ${headermenu_list}    
    Run Keyword If    '${headermenu_list}'!='7'    Fail    "About us sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Aboutus_submenu_txt}
        Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'About Us')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//span[contains(text(),'About Us')]//parent::li//li/a[contains(text(),'${menu_txt}')]
        #${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'About Us')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin About us submenu ${menu_txt} text are mismatch"
    END

Child Sponsorship submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Child Sponsorship')]//parent::li//li/a
    #${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Child Sponsorship')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='6'    Fail    "Child Sponsorship sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Childsponsorship_submenu_txt}
        Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Child Sponsorship')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Child Sponsorship')]//parent::li//li/a[contains(text(),'${menu_txt}')]
        #Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Child Sponsorship')]
        #${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Child Sponsorship')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Child Sponsorship submenu ${menu_txt} text are mismatch"
    END
    
Ways to give submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Ways to Give')]//parent::li//li/a
    Log To Console    ${headermenu_list}
    Run Keyword If    '${headermenu_list}'!='12'    Fail    "Ways to give sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Ways_to_give}
        Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Ways to Give')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Ways to Give')]//parent::li//li/a[contains(text(),'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Ways to give submenu ${menu_txt} text are mismatch"
    END
    
Get involved submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Get Involved')]//parent::li//li/a
    Log To Console    ${headermenu_list}    
    Run Keyword If    '${headermenu_list}'!='2'    Fail    "Get involved sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Get_involved}
        Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Get Involved')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Get Involved')]//parent::li//li/a[contains(text(),'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Get Involved submenu ${menu_txt} text are mismatch"
    END
    
Media submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Media')]//parent::li//li/a
    Log To Console    ${headermenu_list}    
    Run Keyword If    '${headermenu_list}'!='4'    Fail    "Media sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Media_submenu_txt}
        Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Media')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Media')]//parent::li//li/a[contains(text(),'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Media submenu ${menu_txt} text are mismatch"
    END

Partnership submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Partnerships')]//parent::li//li/a
    Log To Console    ${headermenu_list}
    Run Keyword If    '${headermenu_list}'!='1'    Fail    "Partnerships sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Partnership_submenu_txt}
        Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Partnerships')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//span[contains(text(),'Partnerships')]//parent::li//li/a[contains(text(),'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Partnerships submenu ${menu_txt} text are mismatch"
    END
    
Multiple deletion
    #Local browser launch
    Jenkins browser launch
    One time Hunger Free campaign
    Educate children campaign with checkout flow
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    FOR    ${index}    IN    ${get_viewcart_list_count}    1
        Click Element    xpath=(.//a[@class='remove-btn'])[${index}]
        Sleep    10s
    END
    ${check_cartpage_after_complete_del}=    Get Text    xpath=.//div[@class='Empty_basket_Content']/h1
    Run Keyword If    '${check_cartpage_after_complete_del}'!='Your Gift Cart Is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart Is Empty' text not display"

To add child to a cart
    #Local browser launch
    Jenkins browser launch
    Sleep    15s
    Execute Javascript    window.scrollTo(0, 600)
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='container carousel_Sponsor defaultHead']
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${child_name}=    Get Text    xpath=.//div[@class='item active']//h4
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active']//p[@class='pricemnth active']//span[@class='home-price']
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Log To Console    Child name:${child_name} and child amount:${sel_child_amt} and also child img src:${sel_child_imgsrc}
    Click Element    xpath=.//div[@class='item active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active']//input[@id='edit-submit--12']    value
    Run Keyword If    'SPONSOR NOW'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active']//input[@id='edit-submit--12']
    ${child_sponsor_msg}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${child_sponsor_msg}'!='Success !'    Fail    "After child selected 'Sponsor Successfull' text not display"
    ${Sponsor_success_img_chck}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Run Keyword If    '${Sponsor_success_img_chck}'!='${sel_child_imgsrc}'    Fail    "Footer selected child and sponsor successs child image are not match"
    Click Element    xpath=//a[@class='view_cart']
    ${chck_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${child_name}')]
    Run Keyword If    'True'!='${chck_child_name}'    Fail    "Choosed child not display in view cart page"
    ${chck_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${sel_child_amt}')]
    Run Keyword If    'True'!='${chck_child_amt}'    Fail    "Choosed child amount are mismatch in view cart page"

SI Flow payment gateway list and text check
    #Local browser launch
    Jenkins browser launch
    Rescue child campaign
    SI login
    ${check_SI_postlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//form[@class='payment_selection_form']
    Run Keyword If    'True'!='${check_SI_postlogin_page}'    Fail    "SI post login page not display"
    ${SI_payment_list}=    Get Element Count    xpath=.//div[@class='payment-main-content']/div
    Run Keyword If    3!=${SI_payment_list}    Fail    "SI Flow payment gateway list mismatch"
    FOR    ${SI_payment_txt}    IN    @{SI_payment_list_text}
        ${SI_payment_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-main-content']/div[contains(.,'${SI_payment_txt}')]
        Run Keyword If    'True'!='${SI_payment_txt_chck}'    Fail    "SI flow payment gateway ${SI_payment_txt} text are mismatch"
    END
    #nedd to check campaign details
    
Check Add-on added in view cart page
    #Local browser launch
    Jenkins browser launch
    Educate children campaign with checkout flow
    ${check_addon_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='prdt_tle']
    Run Keyword If    'True'!='${check_addon_viewcart}'    Fail    "Viewcart page 'My Body My Rights' add-on not display
    Click Element    xpath=.//label[@for='edit-form-field-field-product-add-on-s-add-to-ca-0-field-product-add-on-s-add-to-ca-value']
    ${Chck_addon_added_or_not}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'My BODY')]
    Run Keyword If    'True'!='${Chck_addon_added_or_not}'    Fail    "After click Add-on not display in view cart page"
    ${hungercamp_amt+Add_on_amt}=    Evaluate    ${edu_child_amt}+${addon_val}
    ${convert_int_to_string_val}=    Convert To String    ${hungercamp_amt+Add_on_amt}
    ${hungercamp_amt+Add_on_amt_final_val}=    Replace String    ${convert_int_to_string_val}    4    4,
    Log To Console    Viewcart final total amount:${hungercamp_amt+Add_on_amt_final_val}
    ${chck_total_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='order-total-line order-total-line__total']/span[@class='order-total-line-value'][contains(.,'₹${hungercamp_amt+Add_on_amt_final_val}')]
    Run Keyword If    'True'!='${chck_total_amt_viewcart}'    Fail    "In view cart page campaign amoutn and add-on amount of total amount are differ"
 
 Child add from child rotator and payment success ccavenue
    #Local browser launch
    Jenkins browser launch
    ${child_display_banner}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='myCarousel']
    Run Keyword If    'True'!='${child_display_banner}'    Fail    "Home banner section child rotator not display"
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${child_name}=    Get Text    xpath=.//div[@class='item active']//h4
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active']//p[@class='pricemnth active']//span[@class='home-price']
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Log To Console    Child name:${child_name} and child amount:${sel_child_amt} and also child img src:${sel_child_imgsrc}
    Click Element    xpath=.//div[@class='item active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active']//input[@id='edit-submit--12']    value
    Run Keyword If    '${footer_proceed_btn}'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active']//input[@id='edit-submit--12']
    ${child_sponsor_msg}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${child_sponsor_msg}'!='Success !'    Fail    "After child selected 'Sponsor Successfull' text not display"
    ${Sponsor_success_img_chck}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Run Keyword If    '${Sponsor_success_img_chck}'!='${sel_child_imgsrc}'    Fail    "Home page banner section selected child and sponsor successs child image are not match"
    Click Element    xpath=.//a[@class='view_detailed']
    ${by_spec_child_count}=    Get Element Count    xpath=//div[@class='row mychilddet']/div/div
    Run Keyword If    ${by_spec_child_count}<1    Fail    "No child in By specifics page"
    Mouse Over    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='bySpecHoverContent']
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='bySpecHoverContent']/input
    ${byspec_child_name}=    Get Text    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='childproduct']//div[@class='inner_banner_pledge_content']/h2
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='com_emergency_flood row']/span[2]/div/label
    ${get_byspec_child_amt}=    Get Element Attribute    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='com_emergency_flood row']/span[2]/div/label    for
    ${add_symbol_to_amt}=    Replace String    ${get_byspec_child_amt}    2    2,
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='SIpatent']//input
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='siNonShow']//div[@class='kl_flood_sub_or_sec']/input
    Click Element    xpath=(.//a[@class='view_cart'])[1]
    ${chck_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${child_name}')]
    Run Keyword If    'True'!='${chck_child_name}'    Fail    "Choosed child not display in view cart page"
    ${chck_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${sel_child_amt}')]
    Run Keyword If    'True'!='${chck_child_amt}'    Fail    "Choosed child amount are mismatch in view cart page"
    ${chck_byspec_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${byspec_child_name}')]
    Run Keyword If    'True'!='${chck_byspec_child_name}'    Fail    "By spec choosed child not display in view cart page"
    ${chck_byspec_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${add_symbol_to_amt}')]
    Run Keyword If    'True'!='${chck_byspec_child_amt}'    Fail    "By spec choosed child amount are mismatch in view cart page"
    View cart proceed button
    Login
    CCavenue payment success flow
 
 Child add from child rotator and add extra child from add another child way
    #Local browser launch
    Jenkins browser launch
    ${child_display_banner}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='myCarousel']
    Run Keyword If    'True'!='${child_display_banner}'    Fail    "Home banner section child rotator not display"
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${child_name}=    Get Text    xpath=.//div[@class='item active']//h4
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active']//p[@class='pricemnth active']//span[@class='home-price']
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Log To Console    Child name:${child_name} and child amount:${sel_child_amt} and also child img src:${sel_child_imgsrc}
    Click Element    xpath=.//div[@class='item active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active']//input[@id='edit-submit--12']    value
    Run Keyword If    '${footer_proceed_btn}'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active']//input[@id='edit-submit--12']
    ${child_sponsor_msg}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${child_sponsor_msg}'!='Success !'    Fail    "After child selected 'Sponsor Successfull' text not display"
    ${Sponsor_success_img_chck}=    Get Element Attribute    xpath=//div[@class='item active']/div/div[1]/div[1]/div/img    src
    Run Keyword If    '${Sponsor_success_img_chck}'!='${sel_child_imgsrc}'    Fail    "Home page banner section selected child and sponsor successs child image are not match"
    Click Element    xpath=.//a[@class='view_detailed']
    ${by_spec_child_count}=    Get Element Count    xpath=//div[@class='row mychilddet']/div/div
    Run Keyword If    ${by_spec_child_count}<1    Fail    "No child in By specifics page"
    Mouse Over    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='bySpecHoverContent']
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='bySpecHoverContent']/input
    ${byspec_child_name}=    Get Text    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='childproduct']//div[@class='inner_banner_pledge_content']/h2
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='com_emergency_flood row']/span[2]/div/label
    ${get_byspec_child_amt}=    Get Element Attribute    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='com_emergency_flood row']/span[2]/div/label    for
    ${add_symbol_to_amt}=    Replace String    ${get_byspec_child_amt}    2    2,
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='SIpatent']//input
    Click Element    xpath=//div[@class='row mychilddet']/div/div[1]//div[@class='addpledge pledgeblock']//div[@class='siNonShow']//div[@class='kl_flood_sub_or_sec']/input
    Click Element    xpath=(.//a[@class='view_cart'])[1]
    ${chck_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${child_name}')]
    Run Keyword If    'True'!='${chck_child_name}'    Fail    "Choosed child not display in view cart page"
    ${chck_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${sel_child_amt}')]
    Run Keyword If    'True'!='${chck_child_amt}'    Fail    "Choosed child amount are mismatch in view cart page"
    ${chck_byspec_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${byspec_child_name}')]
    Run Keyword If    'True'!='${chck_byspec_child_name}'    Fail    "By spec choosed child not display in view cart page"
    ${chck_byspec_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${add_symbol_to_amt}')]
    Run Keyword If    'True'!='${chck_byspec_child_amt}'    Fail    "By spec choosed child amount are mismatch in view cart page"
    View cart proceed button
    Login
    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div[4]
    ${check_visible_sponsor_child_checkout_gateway}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//table/tbody/tr/td[1][contains(.,'${child_name}')]
    Run Keyword If    'True'!='${check_visible_sponsor_child_checkout_gateway}'    Fail    "Selected child name not displayed in checckout payement gateway"
    ${check_visible_byspec_child_name_checkout_gateway}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//table/tbody/tr/td[1][contains(.,'${byspec_child_name}')]
    Run Keyword If    'True'!='${check_visible_byspec_child_name_checkout_gateway}'    Fail    "Selected By spec child name not displayed in checckout payement gateway"
    Click Element    xpath=(.//div[@id='offpay']//label)[1]
    Click Element    xpath=.//span[@class='offline_pay_btn']
    ${check_thq_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='thanks_description']/h1
    Run Keyword If    'True'!='${check_thq_page}'    Fail    "After payment through UPI 'Thank You' page text not display"
    
 Ensure overview campaign label in Hosh menu
    #Local browser launch
    Jenkins browser launch
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Overview')])[1]
    ${overview_menus_list}=    Get Element Count    xpath=.//div[@class='views-element-container']//a
    Run Keyword If    ${overview_menus_list}!=13    Fail    "In Overview page menu list are mismatch"
    Click Element    xpath=//div[@class='col-md-12 ways-scroll-info']/div[1]//h3
    ${chck_banner_image}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='views-field views-field-field-banner-image']
    #Click Element    xpath=.//a[@class='real-gifts-btn']
    #Select Window    https://www.hopetoshine.in/
    #${hosh_url}=    Get Location
    #Log To Console    Hosh url is:${hosh_url}
    #Select Window    URL=https://prod.worldvision.in/real-gifts
    #${wv_url}=    Get Location
    #Log To Console    WV url is:${wv_url}
    Click Element    xpath=//div[@class='gbl_tabbed_menu']/ul/li[2]
    Mouse Over    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@class='IMGSec_cover']
    Click Element    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@class='Gift_add giftBtn']
    Ensure default amount in educational need
    Error default value and check button disable
    View cart page
    Delete view cart campaign

Ensure overview campaign label in Back to school
    #Local browser launch
    Jenkins browser launch
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Overview')])[1]
    ${overview_menus_list}=    Get Element Count    xpath=.//div[@class='views-element-container']//a
    Run Keyword If    ${overview_menus_list}!=13    Fail    "In Overview page menu list are mismatch"
    Click Element    xpath=//div[@class='col-md-12 ways-scroll-info']/div[3]//h3
    Click Element    xpath=//div[@class='gbl_tabbed_menu']/ul/li[2]
    Mouse Over    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@class='IMGSec_cover']
    Click Element    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@class='Gift_add giftBtn']
    Ensure default amount in educational need
    Error default value and check button disable
    View cart page
    Delete view cart campaign

Ensure overview campaign label in Gift catalog
    #Local browser launch
    Jenkins browser launch
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Overview')])[1]
    ${overview_menus_list}=    Get Element Count    xpath=.//div[@class='views-element-container']//a
    Run Keyword If    ${overview_menus_list}!=13    Fail    "In Overview page menu list are mismatch"
    Click Element    xpath=(.//div[@class='views-element-container']//a)[1]
    Execute JavaScript    window.scrollTo(0, 100)
    Sleep    5s
    Mouse Over    xpath=.//div[@class='gift-catelogue']/div[1]//div[@class='item-image']
    Click Element    xpath=.//div[@class='gift-catelogue']/div[1]//input[@class='button--add-to-cart button realGiftsSponsor']
    ${chck_sidediv_enable}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav'])[1]
    Run Keyword If    'True'!='${chck_sidediv_enable}'    Fail    "Side section information tab not display"
    ${chck_val_sidebar}=    Get Text    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='price'])[1]
    ${replace_priceval_spl_symbol}=    Replace String    ${chck_val_sidebar}    ,    ${EMPTY}
    ${final_replace_val}=    Remove String    ${replace_priceval_spl_symbol}    X    ${EMPTY}
    ${actual}=    Strip String    ${final_replace_val}${SPACE}
    ${get_val_addtocart_button}=    Get Element Attribute    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='kl_flood_sub_or_sec']/input)[1]    value
    ${remove_curlybrace}=    Fetch From Left    ${get_val_addtocart_button}    )
    ${again_remove_curlybrace}=    Remove String    ${remove_curlybrace}    (    ${EMPTY}
    ${expected}=    Strip String    ${SPACE}${again_remove_curlybrace}
    Run Keyword If    '${actual}'!='${expected}'    Fail    "Gift Catalog label amount and 'Add to Cart' button amount are mismatch"
    
 Post login menus check
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    ${postloginheadermenu_list}=    Get Element Count    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[//a or //span]
    Log To Console    "No of Post login menus: ${postloginheadermenu_list}"    
    Run Keyword If    '${postloginheadermenu_list}'!='${postlogin_menu_list}'    Fail    "Post login header main menu list size are mismatch"
    ${postlogin_menu_txt}=    Get Text    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[//a or //span]
    FOR    ${postlogin_menu_txt}    IN    @{postlogin_homepage_header_chck_menu_txt}
        Log To Console    "Post login menus are : ${postlogin_menu_txt}"
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li//*[contains(text(),'${postlogin_menu_txt}')]    
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Postlogin home page ${postlogin_menu_txt} text are mismatch"
    END  
    
Post login ways to give submenu list verification
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    ${headermenu_list}=    Get Element Count    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[contains(.,'Ways to Give')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='12'    Fail    "Ways to give sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Ways_to_give}
        Mouse Over    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[contains(.,'Ways to Give')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[contains(.,'Ways to Give')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Postlogin Ways to give submenu ${menu_txt} text are mismatch"
    END
    
Ensure user can able to change passport holder
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name  9600185121
    Click Element    id=edit-pass
    Input Text    id=edit-pass  123456
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My profile')]
    Click Element    xpath=.//a[contains(.,'Edit Profile')]
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    ${ind}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    Log To Console    Indian is choosed:${ind}
    ${other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    Log To Console    Other is choosed:${other}
    Run Keyword If    'True'=='${ind}'    Check other passport holder
    Run Keyword If    'True'=='${other}'    Check indian passport holder
    ${again_other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    Run Keyword If    'True'=='${again_other}'    Check indian passport holder

Checkout flow Other passport holder payment gateways list
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My profile')]
    Click Element    xpath=.//a[contains(.,'Edit Profile')]
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    ${other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    Run Keyword If    'True'!='${other}'    Fail    "By default Other passport holder should be checked but not like that"
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    #Select Hunger free campaign
    Mouse Over    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Hungerfree')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='add-to-cart-section']
    ${hunger_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${split_Hunger_name_with_rightside}=    Remove String    ${hunger_camp_name}    Free
    #${split_Hunger_name_with_rightside}=    Split String From Right    ${hunger_camp_name}    ${EMPTY}
    ${input_val}=    Get Element Attribute    xpath=.//input[@name='manualCart[0][amount]']    value
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
    Click Element    xpath=//a[@class='view_cart']
    ${hunger_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${split_Hunger_name_with_rightside}[0]')]
    Run Keyword If    'True'!='${hunger_camp_viewcart}'    Fail    "Hunger Free campaign not display in view cart page"
    ${replace_val}=    Replace String    ${input_val}    1    1,
    ${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${replace_val}')]
    Run Keyword If    'True'!='${hunger_camp_amt_viewcart}'    Fail    "Hunger Free campaign amount is mismatch in view cart page"
    View cart proceed button
    ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    3!=${checkout_payment_list}    Fail    "Checkout flow Other passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Other passport holder Payment Gateway ${bank_txt} text is mismatch'
    END

Checkout flow Indian passport holder payment gateways list
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    kumaran@xerago.com
    Click Element    id=edit-pass
    Input Text    id=edit-pass    test
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My profile')]
    Click Element    xpath=.//a[contains(.,'Edit Profile')]
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    ${ind}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    Run Keyword If    'True'!='${ind}'    Fail    "By default Indian passport holder should be checked but not like that"
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}
    Mouse Over    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Educate Children')])[1]
    Sleep    5s
    Click Element    xpath=.//div[@class='item-image']//img
    ${educate_chld_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    id=ChkForSI
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    Click Element    xpath=//a[@class='view_cart']
    ${replace_val_educate_camp}=    Replace String    ${edu_child_amt}    4    4,
    ${edu_child_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${educate_chld_camp_name}')]
    Run Keyword If    'True'!='${edu_child_camp_viewcart}'    Fail    "Educate children campaign not display in view cart page"
    ${chck_edu_child_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${replace_val_educate_camp}')]
    Run Keyword If    'True'!='${chck_edu_child_camp_amt_viewcart}'    Fail    "Educate children campaign amount are not display/mismatch in view cart page"
    View cart proceed button
    ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    5!=${checkout_payment_list}    Fail    "Checkout flow Indian passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Indian passport holder Payment Gateway Powered by ${bank_txt} text is mismatch'
    END
    FOR    ${checkout_bank_txt}    IN    @{checkout_payment_list_ind_passport}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/label[contains(.,'${checkout_bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Indian passport holder Payment Gateway ${bank_txt} text is mismatch'
    END
 
Max val alert in view cart page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    Run Keyword If    '${get_viewcart_list_count}'<'1'    Log To Console    "No campaign in view cart page"
    Run Keyword If    '${get_viewcart_list_count}'>'1'    Notification deletion    ${get_viewcart_list_count}    
    
    FOR    ${element}    IN    @{Sponcer_List}
        Ways to give - 5 items    ${element}
    END
    
    ${proceed_btn_disable}=    Run Keyword And Return Status    Element Should Be Disabled    id=edit-checkout
    Run Keyword If    'True'=='${proceed_btn_disable}'    Log To Console    "Proceed button is disabled"
    ${max_erro_msg}=    Run Keyword And Return Status    Element Should Be Visible    //div[@class='max-amount']
    Run Keyword If    'True'!='${max_erro_msg}'    Fail    "Donation is more than 10 lakhs and alert message doesnt appear"
    
*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    .5s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${baseurl}
    Set Browser Implicit Wait    60s

Local browser launch
    Set Selenium Speed    .5s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    60s

Calculation amount
    [Arguments]    ${child_amt}    ${edu_camp_amt}
    ${total_amt}=    Evaluate    ${child_amt}+${edu_camp_amt}
    [Return]    ${total_amt}
    
View cart proceed button
    Click Element    xpath=.//input[@id='edit-checkout']

Mouser hover ways to give campaign
    [Arguments]    ${edu_child}
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'${edu_child}')])[1]

Ensure default amount in educational need
    ${get_val}=    Get Element Attribute    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//div//input[@name='manualCart[0][amount]']    value
    #Log To Console    Input value is:${get_val}
    Run Keyword If    1000!=${get_val}    Fail    "Default value '1000' not display"

Error default value and check button disable
    Click Element    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//div//input[@name='manualCart[0][amount]']
    Clear Element Text    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//div//input[@name='manualCart[0][amount]']
    Input Text    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//div//input[@name='manualCart[0][amount]']    99
    ${chck_button_disable}=    Get Element Attribute    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//input[@class='button button--primary form-submit multi_cart_submit_button']    disabled
    #Log To Console    Diabled value is:${chck_button_disable}
    Run Keyword If    '${chck_button_disable}'!='true'    Fail    "Enter amount '99' but 'ADD TO CART' button not in disable mode"
    Input Text    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//div//input[@name='manualCart[0][amount]']    ${real_gift_enter_val}

View cart page
    ${backto_schl_campaign_name}=    Get Text    xpath=.//div[@class='views-infinite-scroll-content-wrapper clearfix']/div[1]//div[@id='mySidenav']//div[@class='inner_banner_pledge_content']/h2
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
    Click Element    xpath=//a[@class='view_cart']
    ${back_to_school_camp}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${backto_schl_campaign_name}')]
    Run Keyword If    'True'!='${back_to_school_camp}'    Fail    "Back to school campaign not display in view cart page"
    ${real_gift_}=    Replace String    ${real_gift_enter_val}    1    1,
    ${back_to_school_camp_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${real_gift_}')]
    Run Keyword If    'True'!='${back_to_school_camp_amt}'    Fail    "Back to school campaign amount are not display/mismatch in view cart page"

Delete view cart campaign
    Click Element    xpath=(.//a[@class='remove-btn'])[1]
    #${gift_cart_msg}=    Get Text    xpath=//div[@class='Empty_basket_Content']/h1  
    Sleep    10s              
    ${gift_cart_msg1}=    Get Text    xpath=//span[@class='badge notification_badge']
    ${gift_cart_msg1}=    Convert To Integer    ${gift_cart_msg1}  
    Log To Console    ${gift_cart_msg1}      
    Run Keyword If    ${gift_cart_msg1}>=1    Fail    "Your cart have some order left"
    #Run Keyword If    '${gift_cart_msg}'!='Your Gift Cart Is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart Is Empty' text not display" 
    
Login
    Click Element   xpath=//input[@id='edit-login-custom-returning-customer-name']
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-name']    ${user_name}
    Click Element   xpath=//input[@id='edit-login-custom-returning-customer-password']
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-password']    ${password}
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    
  
Direct login
    Click Element    id=edit-name
    Input Text    id=edit-name    ${user_name}
    Click Element    id=edit-pass
    Input Text    id=edit-pass    ${password}
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    
SI login
    Wait Until Page Contains Element    xpath=//input[@id='exampleInputEmail1']    20s
    Click Element    xpath=//input[@id='exampleInputEmail1']
    Input Text    xpath=//input[@id='exampleInputEmail1']    ${user_name}
    Sleep    15s    
    Click Element    xpath=//input[@id='exampleInputPassword1']
    Input Text    xpath=//input[@id='exampleInputPassword1']    ${password}
    Sleep    15s    
    Click Element    id=si_login_btn
    Wait Until Page Contains Element    xpath=//div[@class='payment-main-content']    
    ${si_postlogin_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='payment-main-content']
    Run Keyword If    'True'!='${si_postlogin_chck}'    Fail    "SI flow Postlogin page not display"

CCavenue payment success flow
    #Wait Until Element Is Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by AXIS BANK')]
    #Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by AXIS BANK')]/preceding-sibling::input
    #Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/preceding-sibling::input
    #Sleep    4s
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Click Element    //button[text()='pay my contribution']    
    #Click Element    xpath=.//input[@id='edit-actions-next']
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Click Element    xpath=.//input[@type='submit']
    ${payment_success_msg}=    Get Text    xpath=//div[@id='edit-completion-message']//h3
    Run Keyword If    'PAYMENT SUCCESSFULL'!='${payment_success_msg}'    Fail    "Payment successful page not display"
    
Educate children campaign with checkout flow
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Educate Children')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    ${educate_chld_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    #${check_label_checked}=    Get Element Attribute    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    class
    #Run Keyword If    '${check_label_checked}'!='price save-malnourished-cart-sec current'    Fail    "Selected label not be in checked mode"
    Click Element    id=ChkForSI
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    #${sel_label_quantity}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label/following-sibling::span
    #${sel_educate_label_amt}=    Get Element Attribute    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    for
    #Log To Console    Selected label quantity:${sel_label_quantity}
    #Log To Console    Selected label amount:${sel_educate_label_amt}
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    Click Element    xpath=//a[@class='view_cart']
    ${replace_val_educate_camp}=    Replace String    ${edu_child_amt}    4    4,
    ${edu_child_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${educate_chld_camp_name}')]
    Run Keyword If    'True'!='${edu_child_camp_viewcart}'    Fail    "Educate children campaign not display in view cart page"
    ${chck_edu_child_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${replace_val_educate_camp}')]
    Run Keyword If    'True'!='${chck_edu_child_camp_amt_viewcart}'    Fail    "Educate children campaign amount are not display/mismatch in view cart page"

Checkout flow campaign
    Click Element    xpath=.//div[@class='item-image']//img
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${label_val}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    ${del_month_get_val_only}=    Fetch From Right    ${label_val}    3 Months
    ${final_val}=    Strip String    ${SPACE}${del_month_get_val_only}
    Log To Console    Final val is:${final_val}
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    id=ChkForSI
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    Click Element    xpath=//a[@class='view_cart']
    ${view_cart_amount}=    Get Text    xpath=//td[@class='views-field views-field-total-price__number views-align-center']
    Log To Console    View cart page campaign amount:${view_cart_amount}
    [Return]    ${camp_name}    ${final_val}

SI flow campaign
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${educate_chld_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${label_val}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    ${del_month_get_val_only}=    Fetch From Right    ${label_val}    3 Months
    ${final_val}=    Strip String    ${SPACE}${del_month_get_val_only}
    Log To Console    Final val is:${final_val}
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    xpath=.//button[@class='btn btn-primary si_modal_btn']
    
one time campaign
    Click Element    xpath=.//div[@class='item-image']//img
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    id=ChkForSI
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    Click Element    xpath=//a[@class='view_cart']
    ${camp_val}=    Replace String    ${edu_child_amt}    4    4,
    [Return]    ${camp_name}    ${camp_val}
    
One time Hunger Free campaign
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Hungerfree')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='add-to-cart-section']
    ${hunger_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${hunger_camp_name}=    Remove String    ${hunger_camp_name}    Free
    Log To Console    ${hunger_camp_name}    
    #${split_Hunger_name_with_rightside}=    Split String From Right    ${hunger_camp_name}    ${EMPTY}
    ${input_val}=    Get Element Attribute    xpath=.//input[@name='manualCart[0][amount]']    value
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
    Click Element    xpath=//a[@class='view_cart']
    ${hunger_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${hunger_camp_name}')]
    Run Keyword If    'True'!='${hunger_camp_viewcart}'    Fail    "Hunger Free campaign not display in view cart page"    
    ${replace_val}=    Replace String    ${input_val}    1    1,    
    ${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${replace_val}')]    
    #${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'â‚¹${replace_val}')]
    Run Keyword If    'True'!='${hunger_camp_amt_viewcart}'    Fail    "Hunger Free campaign amount are not display/mismatch in view cart page"
    [Return]    ${input_val}
    
Rescue child campaign
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Childhood Rescue')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    ${rescue_child_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    xpath=.//button[@class='btn btn-primary si_modal_btn']
    
check in view cart page
    [Arguments]    ${camp_name}    ${camp_amt}
    ${camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]
    Run Keyword If    'True'!='${camp_viewcart}'    Fail    "${camp_name} campaign not display in view cart page"
    ${camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${camp_amt}')]
    Run Keyword If    'True'!='${camp_amt_viewcart}'    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"   

Subtract date
    ${CurrentDate}=    Get Current Date    result_format=%Y-%m-%d
    ${date}=    Subtract Time From Date    ${CurrentDate}    3days
    ${sub_time}=    Convert Date    ${date}    datetime
    [Return]    ${sub_time.day}

Today date
    ${CurrentDate}=    Get Current Date    result_format=%Y-%m-%d
    ${datetime}=    Convert Date    ${CurrentDate}    datetime
    [Return]    ${datetime.day}

Notification deletion
    [Arguments]    ${get_viewcart_list_count}
    ${add_val}=    Evaluate    ${get_viewcart_list_count}+1
    FOR    ${index}    IN RANGE    ${add_val}    1
        Click Element    xpath=(.//a[@class='remove-btn'])[${index}]
        Sleep    10s
    END
    ${check_cartpage_after_complete_del}=    Get Text    xpath=.//div[@class='Empty_basket_Content']/h1
    Run Keyword If    '${check_cartpage_after_complete_del}'!='Your Gift Cart Is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart Is Empty' text not display"

Check indian passport holder
    Click Element    xpath=.//label[@for='indctzn']
    Scroll Element Into View    id=edit-submit
    Click Element    id=edit-submit
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    ${chck_indian}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    Run Keyword If    'True'!='${chck_indian}'    Fail    "Other passport holder can't able to change Indian passport holder"

Check other passport holder
    Click Element    xpath=.//label[@for='othctzn']
    Scroll Element Into View    id=edit-submit
    Click Element    id=edit-submit
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    ${chck_other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    Run Keyword If    'True'!='${chck_other}'    Fail    "Indian passport holder can't able to change Other passport holder"

Remove symbol
    [Arguments]    ${val}    ${sysmbol}
    ${output}=    Remove String    ${val}    ${sysmbol}
    [Return]    ${output}

CCAvenue payment failure flow
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Click Element    xpath=.//input[@id='edit-actions-next']
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Wait Until Element Is Visible    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]   15s
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Select From List By Value    xpath=.//select[@name='PAID']    N
    Click Element    xpath=.//input[@type='submit']
    ${payment_success_msg}=    Get Text    xpath=.//div[@class='content block-content']/div/h3/span
    Log To Console    Payment failure text:${payment_success_msg}
    Run Keyword If    'PAYMENT FAILED'!='${payment_success_msg}'    Fail    "Payment Failure page not display"

Payment failure check in home page banner
    ${get_payment_failure_txt}=    Get Text    xpath=.//div[@class='swiper-wrapper']/div/div/p
    Run Keyword If    '${banner_failure_txt}'!='${get_payment_failure_txt}'    Fail    After payment failure, failure section info not display in banner section

Check child duplicate
    Local browser launch
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    Click Element    xpath=.//div[@class='item active']//label[@class='chkSIlabel']
    Click Element    xpath=//div[@class='item active']//input[@id='edit-submit--12']
    ${get_src}=    Get Element Attribute    xpath=(.//*[@class='child_sponsor_image']/img)[1]    src
    Log To Console    Src value is:${get_src}
    Reload Page
    ${get_child_count}=    Get Element Count    xpath=.//*[@class='child_sponsor_image']/img
    ${chceck}=    Evaluate    ${get_child_count}+1
    FOR    ${index}    IN RANGE    1    ${chceck}
        ${currentselece_child_src}=    Get Element Attribute    xpath=(.//*[@class='child_sponsor_image']/img)[${index}]    src
        Run Keyword If    '${currentselece_child_src}'=='${get_src}'    Fail    "Child are duplicate"
    END

Check allow auto debit select default in child rotator
    ${get_count}=    Get Element Count    xpath=.//div[starts-with(@class,'item')]//label[@class='chkSIlabel']/parent::label/following-sibling::div[contains(@style,'display: none')]
    Run Keyword If    ${get_count}>0    Fail    Some one child is not have default 'Alllow Auto Debit' not checked

9600 should select defaulty
    ${get_child_count}=    Get Element Count    xpath=.//*[@class='child_sponsor_image']/img
    ${chceck}=    Evaluate    ${get_child_count}+1
    FOR    ${index}    IN RANGE    1    ${chceck}
        ${active_default_label}=    Get Element Attribute    xpath=(//div[starts-with(@class,'item')]//div[@class='stepwizard-row setup-panel']//div[4]//div[1]//label)[${index}]    class
        Run Keyword If    '${active_default_label}'!='active'    Fail    "Some one child not have default amount '9,600' choosed"
    END

Check rounded checkbox txt and amount
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[4]//div[1]//label[1]
    ${txt_1}=    Get Text    xpath=//div[@class='item active']//div[@class='rota_mandy']//p/span
    Run Keyword If    ${txt}!='₹9,600 every year.'    Fail    "I am willing pay ${txt_1} text amount is mismatch
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${txt_2}=    Get Text    xpath=//div[@class='item active']//div[@class='rota_mandy']//p/span
    Run Keyword If    ${txt}!=' ₹4,800 every 6 months.'    Fail    "I am willing pay ${txt_2} text amount is mismatch
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${txt_3}=    Get Text    xpath=//div[@class='item active']//div[@class='rota_mandy']//p/span
    Run Keyword If    ${txt}!='₹2,400 every 3 months.'    Fail    "I am willing pay ${txt_3} text amount is mismatch
    Click Element    xpath=//div[@class='item active']//div[@class='stepwizard-row setup-panel']//div[3]//div[1]//label[1]
    ${txt_4}=    Get Text    xpath=//div[@class='item active']//div[@class='rota_mandy']//p/span
    Run Keyword If    ${txt}!='₹800 every month.'    Fail    "I am willing pay ${txt_4} text amount is mismatch

Child duplicate checking
    [Arguments]    ${sel_child}
    Click Element    xpath=(//a[@class='site-branding-logo'])[1]
    ${get_child_count}=    Get Element Count    xpath=.//*[@class='child_sponsor_image']/img
    ${chceck}=    Evaluate    ${get_child_count}+1
    FOR    ${index}    IN RANGE    1    ${chceck}
        ${currentselece_child_src}=    Get Element Attribute    xpath=(.//*[@class='child_sponsor_image']/img)[${index}]    src
        Run Keyword If    '${currentselece_child_src}'=='${sel_child}'    Fail    "Child are duplicate"
    END
    
Ways to give - 5 items
    [Arguments]    ${element}
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'${element}')])[1]  
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    ${educate_chld_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
        #Click Auto credit
    Click Element    id=ChkForSI
        #enter Amount
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    1000000
    
        #Add to cart
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
        #Proceed to cart
    Click Element    xpath=//a[@class='view_cart']
