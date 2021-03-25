*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Library           DateTime
Library           RequestsLibrary
Library           BuiltIn
Library           Collections

*** Variables ***
${baseurl}        https://uat.worldvision.in/
${browser}        chrome
${rightside_menu_list}    7
${postlogin_menu_list}    6
${edu_child_amt}    4000
${val}            000
${amount}    1000
${minimum_amount}    101
${accurate_amount}    100
${lesser_amount}    99
${maximum_amount}    99999
${higher_amount}    999999
${hunger_free_camp_amt}    1000
${hunger_camp_name_space}    Free
${month_input}    April
${year_input}    2020
${language_input}    English
${user_name}      9999999995
${password}       password
${OtherPassportUser}    testmail@test.com
${OtherPassportPass}    test
${addon_val}      100
${real_gift_enter_val}    1000
@{email_validation}    asdasdad    934852    )*&%^&^%&^%    @gmail    @gmail.com    @@gmail.com    asdgasd.com    (^*&*^)*&@gmail.com
@{registration_title}    Mr.    Miss.    Mrs.    Dr.
${checkout_payment_list_no}    4
@{HungerFree_alert}    edit-name-error    edit-date-of-birth-error    edit-email-error    edit-mobile-number-error
@{alert_list}    edit-name--error    edit-email--error    edit-contact--error    edit-query-type-error    edit-message-error
@{RegisterFields}    signUpfnameErr    signUplnameErr    signUpEmailErr    signInPhoneErr    signUpPassErr    signUpConPassErr    signUpaddrErr    signUpaddrErr1    signUpaddrErr3    signUpPscodeErr    signUpCityErr    signUpStateErr
@{RegisterFieldCheck}    edit-field-title    edit-field-first-name-0-value    edit-field-last-name-0-value    edit-mail    edit-field-mobile-verify-0-mobile    edit-pass-pass1    edit-pass-pass2    edit-field-registeraddress-0-value    edit-field-address-2-0-value    edit-field-address-3-0-value    edit-field-pin-code-0-value    edit-field-city-0-value    edit-field-regstate-0-value    edit-field-country    edit-field-how-do-you-know-about-worl    edit-field-date-of-birth-0-value  
@{Sponcer_List}    Educate Children    Educate Children    Educate Children    Educate Children    Educate Children    Educate Children    Educate Children    Educate Children    Educate Children    Educate Children
#@{Sponcer_List}    Educate Children    HIV & AIDS    End Child Sexual Abuse    Childhood Rescue    Save Malnourished Children    Educate Children    HIV & AIDS    End Child Sexual Abuse    Childhood Rescue    Save Malnourished Children
@{homepage_header_menu_txt}    About Us    Child Sponsorship    Ways to Give    Get Involved    Partnerships    Media
@{checkout_payment_list_text}    Powered by CC Avenue    Powered by AXIS BANK    POWERED BY HDFC BANK
@{SI_payment_list_text}    NET BANKING    Indian credit card    Debit card
@{checkout_payment_list_ind_passport}    Debit Card/Net banking/Wallets/Amex    International credit card    Indian credit cards    Offline Payment
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
${button_failure_txt}    TRY AGAIN NOW
${pass1}    abc
${pass2}    cba
@{how_do_you_know}    Tele-Caller    Fundraising Volunteer    Existing Donor    Friends and Family    Online Ads    Others
${SIOtherPassMessage}    Auto debit option is not available for the other passport holders, kindly uncheck the “Allow Auto Debit” option and continue your sponsorship.
@{whyDoYouWantToLeave}    Will Donate Later    Know more about us    Already a Donor    Want to add more gifts
@{peopleHaveDonateButton}    by-specifics    educate-children    save-malnourished-children    landingPages/child/index-3.html
@{SocialMedia}    facebook    twitter    linkedin
@{Months}    Dummy    Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec
@{social_medias}    facebook    linkedin    twitter    whatsapp
${green}    (0, 196, 166)
${red}    (244, 65, 52, 1)
${yellow}    (253, 212, 94, 1)
${SICartColour}    (80, 189, 189)
${MandatoryField}    This field is mandatory.
${NewPrice}    ₹ 2400
${NewCampaignPrice}    ₹ 3000

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
    Click Element    xpath=//label[text()='Date of Birth']
    Select From List By Label    xpath=//select[@class='ui-datepicker-year']    1993
    Select From List By Label    xpath=//select[@class='ui-datepicker-month']    Sep
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
    Scroll Element Into View    xpath=//div[@id='edit-actions']//button[@class='singUpRegister']
    Sleep   5s
    Click Element    xpath=//div[@id='edit-actions']//button[@class='singUpRegister']   
    
    FOR    ${element}    IN    @{RegisterFields}
        ${alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpfnameErr
        Run Keyword If    'True'!='${alert}'    Fail    "${element} name alert not display"
    END
    
    Log To Console    "Alert messages are active"
    # ${state_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpStateErr
    # Run Keyword If    'True'!='${state_alert}'    Fail    "State alert not display"

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
    [Tags]    LOGIN
    
    Jenkins browser launch    
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Wait Until Element Is Visible    xpath=//li[@class='welcomesponsor']    60s
    ${postlogin_homepage_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='welcomesponsor']
    Run Keyword If    'True'!='${postlogin_homepage_chck}'    Fail    "Valid user can't able to login Or Post login Page doesnt Load"
    

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
    [Tags]    To Sponsor a Child
    
    Jenkins browser launch
    Main Menu Search Button Click
    Input Data Into Search Box    asdgasgdas
    Press Keys    id=edit-search-api-fulltext    ENTER    
    Search Page Child List    
    ${childName}    Click Add to Cart in Search Page   
    Sleep   5s
    Element Status Check    xpath=(//div[@class='inner_banner_pledge_content'])[1]/h2[contains(text(),'${childName}')]    Selected Child is Displayed    Selected Child is not Displayed    
    ${camp_Amt}=    Click 3Month package
    SI Payment Check Verify
    Proceed to Pay Button
    SI login
    SI payment gateway check

To Sponsor a child by Checkout payment flow from search page
    [Tags]    To Sponsor a Child
    
    Jenkins browser launch
    Main Menu Search Button Click
    Input Data Into Search Box    asdgasgdas
    Press Keys    id=edit-search-api-fulltext    ENTER
    Search Page Child List
    ${childName}    Click Add to Cart in Search Page
    Sleep    5s
    Element Status Check    xpath=(//div[@class='inner_banner_pledge_content'])[1]/h2[contains(text(),'${childName}')]    Selected Child is Displayed    Selected Child is not Displayed          
    ${camp_amt}    Checkout flow campaign - search and donate
    ${cart_quanity}    check in view cart page - Checkout flow    ${childName}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification - dynamic    ${childName}    ${camp_amt}    ${cart_quanity}

# Switching indian citizen to other passport holder in my profile page
    # #Local browser launch
    # Jenkins browser launch
    # Click Element    xpath=//a[contains(text(),'Login')]
    
    # Wait Until Element Is Visible    id=edit-name    15s
    # Click Element    id=edit-name    
    # Input Text    id=edit-name    9600185121
    
    # Wait Until Element Is Visible    id=edit-pass    15s
    # Click Element    id=edit-pass    
    # Input Text    id=edit-pass    123456
    
    # Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    # Mouse Over    xpath=.//li[@class='welcomesponsor']
    # Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My Profile')]
    # Click Element    xpath=.//a[contains(.,'Edit Profile')]
    # Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    # ${ind}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    # Log To Console    Indian is choosed:${ind}
    # Run Keyword If    'True'!='${ind}'    Fail    "User by default have choosed 'Indian' but now it display like 'Other passport' holder"
    # Click Element    xpath=.//label[@for='othctzn']
    # Scroll Element Into View    id=edit-submit
    # Click Element    id=edit-submit
    # Click Element    xpath=.//a[contains(.,'My Gifts')]
    # Banner Alert
    # ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    # ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}        
    # Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    # Mouser hover ways to give campaign    Educate Children
    # Sleep    5s
    # ${val_1}    ${val_2}    Checkout flow campaign
    # check in view cart page    ${val_1}    ${val_2}
    # View cart proceed button
    # ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    # Run Keyword If    3!=${checkout_payment_list}    Fail    "Checkout flow Other passport holder payment list are mismatch"
    # FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        # ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        # Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Other passport holder Payment Gateway ${bank_txt} text is mismatch'
    # END
    # Mouse Over    xpath=.//li[@class='welcomesponsor']
    # Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My Profile')]
    # Click Element    xpath=.//a[contains(.,'Edit Profile')]
    # Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    # Click Element    xpath=.//label[@for='indctzn']
    # Scroll Element Into View    id=edit-submit
    # Click Element    id=edit-submit
    
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
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Sleep   40s
    Navigation banner close
    #Wait Until Element Is Visible    xpath=//li[@class='welcomesponsor']    30s
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'Logout')]    
    #Click Element    class=input-survey    
    #Input Text    input-survey    Test review Data
    #Click Element    class=btnSub-survey    
    Click Element    class=close-survey            
    ${check_success_logout}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//li[@class='pre_lgn']
    Run Keyword If    'True'!='${check_success_logout}'    Fail    "Unable to logout Properly"
    
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
 
To verify child rotator
    [Tags]    Rotator    

    Jenkins browser launch    
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details
    Rotator Child Count    
    #9600 should select defaulty
    Rotator Allow Auto Debit status check
    Rotator Proceed To Autopay Text Check    
    Rotator Proceed To Autopay
    #SI login page#
    Element Status Check    id=exampleModalLabel    SI login page is appeared    SI login page doesnt appear
    #SI login page close#
    Click Element    xpath=//button[@class='close']    
    Rotator SI checkbox Click
    Rotator Sponsor Now Text Check
    Rotator Sponsor Now Click
    Success text in shadow window
    Sleep    5s    
    Rotator Right Nav button
    Sleep    5s    
    Rotator left Nav button
    #Sponsor now button visible
    Sleep    5s    
    Element Status Check    //a[text()='Sponsor Another Child']    Sponsor Another Child button is visible    Sponsor Another Child button is not visible
    Element Status Check    //a[text()='Proceed to Checkout']    Proceed to Checkout button is visible    Proceed to Checkout button is not visible    
    Rotator Proceed to Checkout    
    Rotator Child cart validation    ${child_name}    ${sel_child_amt} 
    Child duplicate checking    ${child_name}
 
To verify search child and donate
    [Tags]    Search functionality
        
    Jenkins browser launch    
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details
    Log To Console    Child name: ${child_name} and child amount: ${sel_child_amt} and also child img src: ${sel_child_imgsrc}
    Rotator Payment validation    ${sel_child_imgsrc}
    Click Element    xpath=//a[@class='view_cart']
    Rotator Child cart validation    ${child_name}    ${sel_child_amt}    
    View cart proceed button
    Login
    CCavenue payment success flow        
    My Next Payment
    My Next Payment Gift Menu and My Child Menu Check      
    Wait Until Element Is Visible    xpath=//div[contains(@class,'chld-items')]//div[@class='cld-nme']/p[contains(.,'${child_name}')]    60s
    ${check_child_display}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[contains(@class,'chld-items')]//div[@class='cld-nme']/p[contains(.,'${child_name}')]
    Run Keyword If    True!=${check_child_display}    Fail    Payment success, But child details doesnt appear in "My Children" tab

To verify child was donated in between gap while user seraching
    #Local browser launch
    Jenkins browser launch
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    id=myCarousel
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"    
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//div[@class='stepwizard-row setup-panel']/div[3]/div/label
    ${child_name}=    Get Text    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//h4
    ${child_name}=    Remove String Using Regexp    ${child_name}    \,.*$
    Log To Console    Child name:${child_name}
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[@id='edit-submit--12']    value
    Run Keyword If    'SPONSOR NOW'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[@id='edit-submit--12']
    ${child_count}=    Get Element Count    xpath=.//div[@class='seach-page-hover-content']/h4
    FOR    ${index}    IN RANGE    1    ${child_count}
    ${chck_sel_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(.//div[@class='seach-page-hover-content']/h4[contains(.,'${child_name}')])[${index}]
    Run Keyword If    True==${chck_sel_child_name}    Fail    Selected child name is displayed in search page
    END

Payment failure banner
    [Tags]    Payment Failure banner Functionallity    

    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${val_1}    ${val_2}    Checkout flow campaign
    check in view cart page    ${val_1}    ${val_2}
    View cart proceed button
    Login
    CCAvenue payment failure flow
    Click Element    xpath=//div[@class='header_new_logo']//img
    Sleep    10s    
    Payment failure check in home page banner    ${button_failure_txt}
    
To verify payment flow using failure banner
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Navigation banner close
    Payment failure check in home page banner - Click   ${button_failure_txt}
    CCavenue payment success flow
    Click Element    xpath=//div[@class='header_new_logo']//a/img  
    Banner Alert
    @{failure_banner}=    Get WebElements    xpath=//div[@class='banner-content']/h2
    FOR    ${element}    IN    @{failure_banner}
        ${text}=    Get Text    ${element}        
        Run Keyword If    'Please try again!'!='${text}'    Log To Console    "Payment Failure banner is changed"    ELSE    fail    'Payment failure banner is still exist'   
    END    
    
    
To sponsor a Educate Children Campaign using Checkout flow
    [Tags]    Educate Children Campaign
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}

To sponsor a Save Malnourished Children Campaign using Checkout flow
    [Tags]    Save Malnourished Children Campaign
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    Save Malnourished Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}
    
To sponsor a Childhood Rescue Campaign using Checkout flow
    [Tags]    Childhood Rescue Campaign

    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    Childhood Rescue
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}

To sponsor a Hunger Free Campaign as a one time donation using Checkout flow
    [Tags]    Hunger Free Campaign

    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign     Hungerfree 
    ${camp_name}    ${Camp_val}    one time campaign - Hunger Free campaign       
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}

To sponsor a Where Most Needed Campaign as a one time donation using Checkout flow
    [Tags]    Where Most Needed Campaign
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete          
    Mouser hover ways to give campaign    Where Most Needed
    ${camp_name}    ${Camp_val}    one time campaign - Where Most Needed Campaign       
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}

To sposor a Educate Children Campaign as a one time donation using Checkout flow
    [Tags]    Educate Children Campaign
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    Educate Children
    ${camp_name}    ${Camp_val}    one time campaign
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}

To sponsor a Rescue Children Campaign using Si payment Flow from Educate Children campaign page
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete           
    Mouser hover ways to give campaign    Childhood Rescue
    SI flow campaign
    SI login

To sponsor a Help HIV aids Campaign using Si payment Flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    HIV & AIDS
    SI flow campaign
    SI login

To sponsor a Protect Girl Children Campaign using Si payment Flow from Educate Children campaign page
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    End Child Sexual Abuse
    SI flow campaign
    SI login

To sponsor child using SI flow
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    
    Click Element    xpath=//div[@class='header_new_logo']//img    

    Sleep    10s
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    id=myCarousel
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//div[@class='stepwizard-row setup-panel']/div[3]/div/label
    ${child_name}=    Get Text    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//h4
    ${child_name}=    Remove String Using Regexp    ${child_name}    \,.*$
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//p[@class='pricemnth active']//span[@class='home-price']
    ${remove_comma_symbol}=    Remove symbol    ${sel_child_amt}    .00
    ${remove_dollor_symbol}=    Remove symbol    ${remove_comma_symbol}    ₹
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']/div/div[1]/div[1]/div/img    src
    Log To Console    Child name:${child_name} and child amount:${remove_dollor_symbol} and also child img src:${sel_child_imgsrc}
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//button[@class='btn btn-primary si_modal_btn']
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
    [Tags]    Post Login 
    
    Jenkins browser launch
    Click Login
    Direct login           
    Click Cart   
    Banner Alert            
    Cart campaign check and delete
    My Next Payment
    Wait Until Element Is Visible    xpath=//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]    60s
    My Next Payment MainMenu and SubMenu    Donation    My Donations
    Sleep    5s    
    ${hunger_free_label_chck}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//p[contains(.,'Nutrition for every child-Hungerfree campaign')]
    Run Keyword If    'True'!='${hunger_free_label_chck}'    Fail    "Hunger free label not found"  
    
    #Move to hungerfree campaign    
    Mouse hover ways to give after login    Hungerfree
    Click Element    xpath=//div[@class='add-to-cart-section']
        
    Wait Until Element Is Visible    xpath=//div[@class='inner_banner_pledge_content']/h2/div    
    ${campName}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_Name}=    Remove String    ${campName}    Free    
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='manualCart[0][amount]']    value
    Log To Console    Hunger campaign get input amount:${get_input_val}    
    Add to cart text change
    Click Add To Cart
    Success text in shadow window
    Click Proceed To Checkout Button
    Banner Alert      
    
    ${hunger_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_Name}')]
    Run Keyword If    'True'!='${hunger_camp_viewcart}'    Fail    "Hunger Free campaign not display in view cart page"
    ${replace_val}=    Replace String    ${get_input_val}    1    1,
    
    ${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${replace_val}')]
    Run Keyword If    'True'!='${hunger_camp_amt_viewcart}'    Fail    "Hunger Free campaign amount are not display/mismatch in view cart page"
    View cart proceed button
    CCavenue payment success flow
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Donations 
    Page Should Contain Element    xpath=//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Nutrition for every child-${campName}free campaign')]
    
    ${today_date}=    Get Current Date    result_format=%Y-%m-%d
    ${today_date}=    Convert Date    ${today_date}    result_format=%d-%m-%Y
    
    Element Should Be Visible    xpath=//p[contains(.,'Nutrition for every child-${campName}free campaign')]/parent::div/following-sibling::div/p[3][contains(text(),'${today_date}')]    60s   
   
Just pre login check hungerfree campaign
    [Tags]    PreLogin
    
    Jenkins browser launch
    Click Login
    Direct login
    My Next Payment
    Wait Until Element Is Visible    xpath=//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]    60s
    My Next Payment Gift Menu Check and Select Submenu    My Donations
    Sleep    5s
    ${hunger_free_label_chck}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//p[contains(.,'Nutrition for every child-Hungerfree campaign')]
    Run Keyword If    'True'!='${hunger_free_label_chck}'    Fail    "Hunger free label not found"
    Logout
    Click Element    class=close-survey
    ${title}=    Get Title
    Should Contain    ${title}    Log in
    Mouser hover ways to give campaign    Hungerfree
    ${CampAmt}    ${camp_name}    One time Hunger Free campaign
    Log To Console    Hunger campaign get input amount:${CampAmt}
    View cart proceed button
    Login
    CCavenue payment success flow
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Donations
    Page Should Contain Element    xpath=//div[@class='childData']/following-sibling::div//div[@class='cld-nme']/p[contains(.,'Nutrition for every child-${campName}free campaign')]
    ${today_date}=    Get Current Date    result_format=%Y-%m-%d
    ${today_date}=    Convert Date    ${today_date}    result_format=%d-%m-%Y
    Element Should Be Visible    xpath=//p[contains(.,'Nutrition for every child-${campName}free campaign')]/parent::div/following-sibling::div/p[3][contains(text(),'${today_date}')]    60s   

To download tax receipt 
    [Tags]    Tax Receipt Page
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Navigation banner close
    Click Element    xpath=//li/a[contains(text(),'Tax Receipts')] 
    Sleep    40s
    Banner Alert             
    ${chk_disable_download_Btn}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//a[@class='downloadpdf']
    Run Keyword If    'True'!='${chk_disable_download_Btn}'    Fail    "Tax receipts page by default 'Download Tax Receipt' button is enable"    ELSE    Log To Console    'By default "Download Tax Receipt" button is Disabled'                
    Click Element    id=edit-created-min
    Sleep    5s    
    Select From List By Label    class=ui-datepicker-month    May
    Sleep    5s    
    Select From List By Label    class=ui-datepicker-year    2020
    Sleep    5s    
    ${get_date_count}=    Get Element Count    xpath=//table[@class='ui-datepicker-calendar']//tbody/tr/td/a
    FOR    ${index}    IN RANGE    1    ${get_date_count}
        ${get_date_txt}=    Get Text    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        ${sub_date_}=    Subtract date
        Run Keyword If    '${get_date_txt}'=='${sub_date_}'    Click Element    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        Exit For Loop If    '${get_date_txt}'=='${sub_date_}'
    END
    Sleep    20s
    Click Element    id=edit-created-max
    ${get_count_date}=    Get Element Count    xpath=//table[@class='ui-datepicker-calendar']//tbody/tr/td/a
    FOR    ${index}    IN RANGE    1    ${get_count_date}+1    
        ${get_txt_date}=    Get Text    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        ${today_date}=    Today date
        Run Keyword If    '${get_txt_date}'=='${today_date}'    Click Element    xpath=(//table[@class='ui-datepicker-calendar']//tbody/tr/td/a)[${index}]
        Exit For Loop If    '${get_txt_date}'=='${today_date}'
    END
    Sleep    10s        
    Click Element    id=generate_tax
    ${tax_receipt}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//div[contains(@class,'no-data-found')]
    Run Keyword If    'True'!='${tax_receipt}'    Fail    "Tax receipt are not loading"    ELSE    Log To Console    'Tax receipts are loading'



    
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
    FOR    ${index}    IN RANGE    ${get_viewcart_list_count}    0    -1
        Log To Console    Count: ${index}    
        Click Element    xpath=(//a[@class='remove-btn'])[${index}]    
        Sleep    10s    
    END           
    ${check_cartpage_after_complete_del}=   Get Text    xpath=//div[@class='Empty_basket_Content']/h1    
    Run Keyword If    '${check_cartpage_after_complete_del}'!='Your Gift Cart is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart is Empty' text not display"

To add child to a cart            

    Jenkins browser launch
    #Execute Javascript    window.scrollTo(0, 600)
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details
    Log To Console    Child name:${child_name} and child amount:${sel_child_amt} and also child img src:${sel_child_imgsrc}        
    Rotator Payment validation    ${sel_child_imgsrc}
    Click Element    xpath=//a[@class='view_cart']
    Rotator Child cart validation    ${child_name}    ${sel_child_amt}

To verify payment gateway for SI 
    [Tags]    Payment Gateway For SI

    Jenkins browser launch
    Cart campaign check and delete          
    Mouser hover ways to give campaign    Save Malnourished Children
    SI flow campaign
    SI login 
    SI payment gateway check
    
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
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details    
    Log To Console    Child name: ${child_name} and child amount: ${sel_child_amt} and also child img src: ${sel_child_imgsrc}
    Rotator Payment validation    ${sel_child_imgsrc}
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
    
    Rotator Child cart validation    ${child_name}    ${sel_child_amt}    
    
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
        
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details
    Log To Console    Child name: ${child_name} and child amount: ${sel_child_amt} and also child img src: ${sel_child_imgsrc}
    Rotator Payment validation    ${sel_child_imgsrc}
    
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
    
    Rotator Child cart validation    ${child_name}    ${sel_child_amt}

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
    [Tags]    Hope to Shine campaign
    
    Jenkins browser launch
    Mouser hover ways to give campaign    Overview    
    ${overview_menus_list}=    Get Element Count    xpath=.//div[@class='views-element-container']//a
    Run Keyword If    ${overview_menus_list}!=12    Fail    "In Overview page menu list are mismatch"
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
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='IMGSec_cover']    
    Run Keyword If    '${status}'!='True'    Fail    Current there is no child in the education tab
    Mouse Over    xpath=//div[@class='IMGSec_cover']
    Sleep    5s    
    Click Element    xpath=//div[@class='Gift_add giftBtn']/input    
    Ensure default amount in educational need
    Add to cart functionality    
    Clear and input text    1000
    #Error default value and check button disable
    View cart page
    Sleep    10s        
    Cart campaign check and delete
    
Ensure overview campaign label in Back to school
    [Tags]    Back to school campaign       

    Jenkins browser launch
    Mouse Over    xpath=//div[@class='main-menu-inner']//li/span[contains(.,'Ways to Give')]
    Click Element    xpath=//div[@class='main-menu-inner']//li/a[contains(.,'Overview')]
    ${overview_menus_list}=    Get Element Count    xpath=//div[@class='views-element-container']//a
    Run Keyword If    ${overview_menus_list}!=12    Fail    "In Overview page menu list are mismatch"
    Click Element    xpath=//div[@class='col-md-12 ways-scroll-info']/div[3]//h3    
    #${chck_banner_image}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='views-field views-field-field-banner-image']    
    Click Element    xpath=//div[@class='gbl_tabbed_menu']/ul/li[2]
    Mouse Over    xpath=//div[@class='IMGSec_cover']
    Sleep    5s    
    Click Element    xpath=//div[@class='Gift_add giftBtn']/input
    Ensure default amount in educational need
    Add to cart functionality    
    Clear and input text    1000
    #Error default value and check button disable
    View cart page
    Sleep    10s    
    Cart campaign check and delete
    
Ensure overview campaign label in Gift catalog
    [Tags]    Gift catalog

    Jenkins browser launch
    Mouse Over    xpath=//div[@class='main-menu-inner']//li/span[contains(.,'Ways to Give')]
    Click Element    xpath=//div[@class='main-menu-inner']//li/a[contains(.,'Overview')]
    ${overview_menus_list}=    Get Element Count    xpath=.//div[@class='views-element-container']//a
    Run Keyword If    ${overview_menus_list}!=12    Fail    "In Overview page menu list are mismatch"
    Click Element    xpath=(//div[@class='views-element-container']//a)[1]
    Execute JavaScript    window.scrollTo(0, 100)
    Sleep    5s
    Mouse Over    xpath=(//div[@class='bySpecHoverContent'])[1]
    Click Element    xpath=(//input[contains(@class,'realGiftsSponsor')])[1]
    
    ${chck_sidediv_enable}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav'])[1]
    Run Keyword If    'True'!='${chck_sidediv_enable}'    Fail    "Side section information tab not display"
    
    ${camp_name}=    Get Text    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav'][1])[1]//div[@class='inner_banner_pledge_content']/h2
    ${camp_name}=    Get Substring    ${camp_name}    0    11
    ${chck_val_sidebar}=    Get Text    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='price'])[1]
    ${camp_amt_button}=    Remove String    ${chck_val_sidebar}    .00     
    ${camp_amt}=    Convert to price    ${camp_amt_button}         

    ${get_val_addtocart_button}=    Get Element Attribute    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='kl_flood_sub_or_sec']/input)[1]    value    
    ${button_amt}=    Convert to price    ${get_val_addtocart_button}
    Run Keyword If    ${camp_amt}!=${button_amt}    Fail    "Gift Catalog label amount and 'Add to Cart' button amount are mismatch"        

    Add to cart functionality - Gift catalog

    Clear Element Text    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/input)[1]

    Click Element    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='kl_flood_sub_or_sec']/input)[1]    

    Click Element    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav'][1])//a[contains(text(),'Proceed To Checkout')]    
    
    ${camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]
    Run Keyword If    'True'!='${camp_viewcart}'    Fail    "${camp_name} campaign not display in view cart page"
    ${camp_amt_viewcart}=    Get Text    xpath=//td[@class='views-field views-field-product-id'][contains(.,'Food Basket')]/following-sibling::td[3]
    ${camp_amt_viewcart}=    Convert to price    ${camp_amt_viewcart}
    Run Keyword If    ${camp_amt}!=${camp_amt_viewcart}    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"   
    ${cart_quanity}=    Get Element Attribute    xpath=//span[@class='dynamic-quantity']//input    value
    
    View cart proceed button
    Login
    CCavenue payment success flow
    
Post login menus check
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Sleep   15s
    ${postloginheadermenu_list}=    Get Element Count    xpath=//div[@class='main-menu-inner']//nav[@data-menu-name='post-login-menu-section']/div/ul/li
    Log To Console    "No of Post login menus: ${postloginheadermenu_list}"    
    Run Keyword If    '${postloginheadermenu_list}'!='${postlogin_menu_list}'    Fail    "Post login header main menu list size are mismatch"
    #${postlogin_menu_txt}=    Get Text    xpath=//div[@class='main-menu-inner']//ul[@class='we-mega-menu-ul nav nav-tabs']/li
    FOR    ${postlogin_menu_txt}    IN    @{postlogin_homepage_header_chck_menu_txt}        
        Log To Console    "Post login menus are : ${postlogin_menu_txt}"
        Mouse Over    xpath=//div[@class='main-menu-inner']//nav[@data-menu-name='post-login-menu-section']/div/ul/li/*[contains(text(),'${postlogin_menu_txt}')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='main-menu-inner']//nav[@data-menu-name='post-login-menu-section']/div/ul/li/*[contains(text(),'${postlogin_menu_txt}')]    
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Postlogin home page ${postlogin_menu_txt} text are mismatch"
    END  
    
Post login ways to give submenu list verification
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    ${headermenu_list}=    Get Element Count    xpath=//li/span[contains(text(),'Ways to Give')]/parent::li//ul//a
    Log To Console    No of Submenus: ${headermenu_list}    
    Run Keyword If    '${headermenu_list}'!='12'    Fail    "Ways to give sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Ways_to_give}
        Mouse Over    xpath=//li/span[contains(text(),'Ways to Give')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//li/span[contains(text(),'Ways to Give')]/parent::li//ul//a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Postlogin Ways to give submenu ${menu_txt} text are mismatch"
    END
    
# Ensure user can able to change passport holder
    # Jenkins browser launch
    # Click Element    xpath=//a[contains(text(),'Login')]
    # Click Element    id=edit-name
    # Input Text    id=edit-name  aswin.l@live.in
    # Click Element    id=edit-pass
    # Input Text    id=edit-pass  test
    # Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    # Mouse Over    xpath=.//li[@class='welcomesponsor']
    # Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'My Profile')]
    # Click Element    xpath=.//a[contains(.,'Edit Profile')]
    # Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
    # ${ind}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    # Log To Console    Indian is choosed:${ind}
    # ${other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    # Log To Console    Other is choosed:${other}
    # Run Keyword If    'True'=='${ind}'    Check other passport holder
    # Run Keyword If    'True'=='${other}'    Check indian passport holder
    # ${again_other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    # Run Keyword If    'True'=='${again_other}'    Check indian passport holder
    
Indian citizen should not change to Other passport holder
    Jenkins browser launch
    Click Login
    Direct login
    MyProfile Edit
    ${ind}=    Execute Javascript    return window.jQuery('#indctzn').prop('checked')
    Log To Console    Indian is choosed:${ind}      
    Run Keyword If    'True'=='${ind}'    Check other passport holder
    
Other passport holder should not change to Indian passport holder
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login - Other passport user
    Navigation banner close
    MyProfile Edit
    ${other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    Log To Console    Other is choosed:${other}  
    Run Keyword If    'True'=='${other}'    Check indian passport holder

To verify payment gateways for other passport holder
    [Tags]    Payment gateway Based on Nationality
    
    Jenkins browser launch
    Click Login
    Direct login - Other passport user
    Click Element    xpath=.//a[contains(.,'My Gifts')]    
    Banner Alert
    Cart campaign check and delete
    View Myprofile    
    Nationality Check        
    # ${other}=    Execute Javascript    return window.jQuery('#othctzn').prop('checked')
    # Run Keyword If    'True'!='${other}'    Fail    "By default Other passport holder should be checked but not like that"    
    Mouse hover ways to give after login    Educate Children
    ${camp_name}    ${camp_amt}     Other Passport Flow
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    ${camp_amt}=    Convert to price    ${camp_amt}
    Hdfc bank payment gateway check          

To verify payment gateways for indian citizen
    [Tags]    Payment gateway Based on Nationality
    
    Jenkins browser launch
    Click Login
    Direct login
    View Myprofile
    Nationality Check - Indian    
    Click Cart    
    Banner Alert   
    Cart campaign check and delete
    Mouse hover ways to give after login    Educate Children    
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    #Indian payment gateway check - payment type  
    Indian payment gateway check - payment gateway
 
Max val alert in view cart page
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}                   
    FOR    ${sponcer}    IN    @{Sponcer_List}
        Ways to give - 5 items    ${sponcer}
    END
    ${proceed_btn_disable}=    Run Keyword And Return Status    Element Should Be Disabled    id=edit-checkout
    Run Keyword If    'True'=='${proceed_btn_disable}'    Log To Console    "Proceed button is disabled"
    ${max_erro_msg}=    Run Keyword And Return Status    Element Should Be Visible    //div[@class='max-amount']
    Run Keyword If    'True'!='${max_erro_msg}'    Fail    "Donation is more than 10 lakhs and alert message doesnt appear"
    
Verify User should able to Edit Existing profile details
    [Tags]    My Profile
    Jenkins browser launch
    Click Element    xpath=//a[text()='Login']
    Direct login
    Sleep    20s    
    Navigation banner close
    MyProfile Edit
    Scroll Element Into View    id=edit-submit
    Click Element    id=edit-submit   
    
To verify app store and google play link appear in postlogin
    [Tags]    Page Footer
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Navigation banner close
    Scroll Element Into View    xpath=//img[contains(@src,'app store.PNG')]
    ${status_appstore}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//img[contains(@src,'app store.PNG')]
    ${status_playstore}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//img[contains(@src,'gppgle pay.PNG')]    
    Run Keyword If  'True'!='${status_appstore}' or 'True'!='${status_playstore}'    Fail    "AppStore and PlayStore images are not visible in POST-LOGIN page"    ELSE    Log To Console    "AppStore and PlayStore images are visible in POST-LOGIN page"

To verify app store and google play link should not appear in prelogin
    [Tags]    Page Footer
    
    Jenkins browser launch
    Navigation banner close
    Execute Javascript    window.scrollTo(0, 900)
    ${status_appstore}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//img[contains(@src,'app store.PNG')]
    ${status_playstore}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//img[contains(@src,'gppgle pay.PNG')]    
    Run Keyword If  'True'!='${status_appstore}' or 'True'!='${status_playstore}'    Fail    "AppStore and PlayStore images are visible in PRE-LOGIN page"    ELSE    Log To Console    "AppStore and PlayStore images are not visible in PRE-LOGIN page"     

To verify my campaign details for existing user
    [Tags]    My Campaign
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'My Campaign')]    
    ${campaign_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='userCampHolder']//a    
    Run Keyword If    'True'!='${campaign_status}'    Fail    'My campaign details are not visible'    ELSE    MyCampaign List

# To verify my campaign details for new user
    # [Tags]    My Campaign
    # Jenkins browser launch
    # Navigation banner close
    # Registration - Indian    
    # Navigation banner close
    # Click Element    xpath=//a[contains(text(),'My Campaign')]    
    # ${campaign_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='userCampHolder']//a    
    # Run Keyword If    'True'!='${campaign_status}'    Fail    'My campaign details are not visible'    ELSE    MyCampaign List

To verify Overview page
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Navigation banner close
    Mouse Over    xpath=//li/span[contains(text(),'Ways to Give')]
    Click Element    xpath=//a[contains(text(),'Overview')]    
    ${campaign_status}=    Run Keyword And Return Status    Element Should Be Visible    class=Way_give_title    
    Run Keyword If    'True'!='${campaign_status}'    Fail    'Overview campaign details are not visible'    ELSE    Overview List 

To Verify current emergency campaign in overview page
    [Tags]    Overview Page
    
    Jenkins browser launch
    Navigation banner close
    ${mylist} =    Create List
    Mouser hover ways to give campaign    Emergency Relief
    ${Emergency_relief}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(@id,'current-emergency')]
    Run Keyword If    ${True}!=${Emergency_relief}    Fail    There are no current "emergency page"    ELSE    Log To Console    Redirected to "emergency page"       
    @{emergency_relief}=    Get WebElements    xpath=//h5[@class='campaign-title']/a
    FOR    ${element}    IN    @{emergency_relief}
        ${text}=    Get Text    ${element}
        Log To Console    Current Emergencey reliefs are: ${text}    
        Append To List    ${mylist}    ${text}    
    END    
    Mouser hover ways to give campaign    Overview                       
    FOR    ${element}    IN    @{mylist}                 
        ${list_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//h3[contains(text(),'${text}')]    
        Run Keyword If    ${True}==${list_status}    Log To Console    "Emergency relief camapigns are visible in Overview page"    ELSE    Fail    "Emergency relief camapigns are not visible in Overview page"
    END
    
Verify user should Able to add profile details with Valid Data
    [Tags]    My Profile    

    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Navigation banner close
    MyProfile Edit
    Click Element    xpath=//input[contains(@id,'edit-field-pan-number')]    
    
    Input Text    xpath=//input[@id='edit-field-last-name-0-value']    NewLastName Test
    Input Text    Xpath=//input[@id='edit-field-registeraddress-0-value']    New Test address1 Test
    Input Text    xpath=//input[@id='edit-field-address-2-0-value']    New Test address2 Test
    
    Scroll Element Into View    id=edit-submit    
    Click Element    id=edit-submit

    View Myprofile    

    ${last_Name}=    Get Text    xpath=//span[@class='userspanprofile']/div
    Run Keyword If    'NewLastName Test'=='${last_Name}'    Log To Console    "LastName Updated in Edit profile"    ELSE    Fail    "Unable to edit Last Name"
    ${address_1}=    Get Text    xpath=//li[@class='user_address']/div//div[2]
    Run Keyword If    'New Test address1 Test'=='${address_1}'    Log To Console    "Address field 1 Updated in Edit profile"    ELSE    Fail    "Unable to edit Address field 1"
    ${address_2}=    Get Text    xpath=(//span[@class='userspanprofile1'])[1]/div
    Run Keyword If    'New Test address2 Test'=='${address_2}'    Log To Console    "Address field 2 Updated in Edit profile"    ELSE    Fail    "Unable to edit Address field 2"
    
    MyProfile Edit
    Input Text    xpath=//input[@id='edit-field-last-name-0-value']    NewLastName
    Input Text    Xpath=//input[@id='edit-field-registeraddress-0-value']    New Test address1
    Input Text    xpath=//input[@id='edit-field-address-2-0-value']    New Test address2
    
    Scroll Element Into View    id=edit-submit    
    Click Element    id=edit-submit
    
    View Myprofile    
  
To verify that user can edit the City State Country even though it is auto Populated
    [Tags]    Registration Page
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]     
    Sleep    10s          
    Scroll Element Into View    class=singUpRegister    
    #Click Element    xpath=//input[contains(@id,'edit-field-pin-code')]    
    Input Text    xpath=//input[contains(@id,'edit-field-pin-code')]    600123          
    # ${chat_box}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='ChatOpen']/div[2]    
    # Run Keyword If    'True'=='${chat_box}'    Click Element    xpath=//div[@id='ChatOpen']/div[2]     ELSE    Log To Console    "Chat Box was not present"
    #Pincode
    #Click Element    xpath=//input[contains(@id,'edit-field-pin-code')]    
    Clear Element Text    xpath=//input[contains(@id,'edit-field-pin-code')]
    Input Text    xpath=//input[contains(@id,'edit-field-pin-code')]    600012    
    #City
    #Click Element    xpath=//input[contains(@id,'edit-field-city')]    
    Clear Element Text    xpath=//input[contains(@id,'edit-field-city')]
    Input Text    xpath=//input[contains(@id,'edit-field-city')]    Chennai
    #State
    #Click Element    xpath=//input[contains(@id,'edit-field-regstate')]    
    Clear Element Text    xpath=//input[contains(@id,'edit-field-regstate')]
    Input Text    xpath=//input[contains(@id,'edit-field-regstate')]    Tamil Nadu    
    #Country
    Select From List By Label    id=edit-field-country    India  
 

To Verify Existing user Email Id and Phone Should not Accept for New User Registration
    [Tags]    Registration Page
        
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]     
    Sleep    10s          
    Registration - Indian - Test
    ${email_status}=    Run Keyword And Return Status    Element Should Be Visible    id=signUpEmailErr
    Run Keyword If    'True'=='${email_status}'    Log To Console    "Email alert is dispayed"    ELSE    Fail    "Email alert was not displayed"
    ${phone_status}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPhoneErr
    Run Keyword If    'True'=='${phone_status}'    Log To Console    "phone number alert is dispayed"    ELSE    Fail    "Phone number alert was not displayed"   
    
To sponsor a Rescue Children Campaign as a one time donation using Checkout flow
    [Tags]  Childhood Rescue Campaign
        
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}           
    Mouser hover ways to give campaign    Childhood Rescue
    Click Element    xpath=.//div[@class='item-image']//img
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_name}=    Remove String    ${camp_name}    Childhood
    Log To Console    ${camp_name}    
    Sleep    15s
    #Wait Until Element Is Visible    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    15s    
    Click Element    id=ChkForSI
    Click Element    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]    
    Input Text    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]    ${amount}    
    ${button_text}=    Get Element Attribute    xpath=//div[@class='kl_flood_sub_or_sec']/input    value
    Run Keyword If    'Add to cart'=='${button_text}'    Log To Console    "Button changed to ADD TO CART"    ELSE    Fail    "Button was not changed to ADD TO CART"     
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']/input
    Click Element    xpath=//div[@class='cart-buttons']/a[2]    
    ${amount}=    Replace String    ${amount}    1    1,
    check in view cart page    ${camp_name}    ${amount}
    View cart proceed button
    Login
    CCavenue payment success flow    


To sponsor a Save malnourished Children Campaign using Si payment Flow from Educ
    [Tags]    Save Malnourished Children Campaign
    
    Jenkins browser launch
    Cart campaign check and delete          
    Mouser hover ways to give campaign    Save Malnourished Children
    SI flow campaign
    SI login 
    SI payment gateway check

To sponsor a Save malnourshied Children Campaign as a one time donation using Checkout flow
    [Tags]    Save Malnourished Children Campaign 
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Save Malnourished Children  
    ${camp_name}    ${Camp_val}    one time campaign - Save malnourshied Children Campaign
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}

To sponsor a Educate Children Campaign using Si payment Flow from Educate Children campaign page
    [Tags]    Educate Children Campaign
    
    Jenkins browser launch
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    SI flow campaign
    SI login    
    SI payment gateway check

To sponsor a Protect Girl Children Campaign as a one time donation using Checkout flow
    [Tags]    Protect Girl Children Campaign
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    End Child Sexual Abuse  
    ${camp_name}    ${Camp_val}    one time campaign
    ${cart_quanity}    check in view cart page - One time donation flow   ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}

To select children through location filter
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child    
    Wait Until Element Is Visible    class=gbl_banner_content    60s
    BySpecific Selected By Default
    Most Needed Child Selected By Default
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//label[contains(@for,'locality-the-top-level-administrative-subdivision')])[1]/span[1]           
    Run Keyword If    '${status}'!='True'    Fail    Currently there are no childrens available    
    ${state}=    Get Text    xpath=(//label[contains(@for,'locality-the-top-level-administrative-subdivision')])[1]/span[1]
    Click Element    xpath=(//label[contains(@for,'locality-the-top-level-administrative-subdivision')])[1]/span[1]    
    Scroll Element Into View    xpath=//span[text()='Month']
    Sleep    5s    
    ${AvailableChild}=    Get Element Count    xpath=//div[@class='bySpecLocation']/p
    FOR    ${Index}    IN RANGE    1    ${AvailableChild}+1
        Sleep    5s    
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[@class='bySpecLocation']/p[contains(text(),'${state}')])[${Index}]
        Run Keyword If    'True'!='${status}'    Fail    "Childrens state is mismatching"    ELSE    Log    "Childrens state is matching"
    END

To select children through age filter
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child 
    Wait Until Element Is Visible    class=gbl_banner_content    60s  
    BySpecific Selected By Default  
    Most Needed Child Selected By Default
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//label[@for='age-range-above-12-years']//span[contains(text(),'Above 12 Years')]    
    Run Keyword If    'True'!='${status}'    Fail    Currently there are no childrens or Childrens age are below 12 years    ELSE    Log    Children's are found
    
    ${age}=    Get Text    xpath=//label[@for='age-range-above-12-years']//span[contains(text(),'Above 12 Years')]
    ${ChildAge}=    Convert to price    ${age}
               
    Click Element    xpath=//label[@for='age-range-above-12-years']//span[contains(text(),'Above 12 Years')] 
    Sleep    5s         
    ${age_count}=    Get Element Count    xpath=//div[@class='bySpecinfo']//span[1]
    Log To Console    No of childrens found: ${age_count}
    FOR    ${element}    IN RANGE    1    ${age_count}+1    
        Mouse Over    xpath=(//div[@class='bySpecHoverContent'][1])[${element}]        
        ${Text}=    Get Text    xpath=(//div[@class='bySpecinfo']//span[1])[${element}]
        ${element_age}=    Convert To Integer    ${Text}
        Run Keyword If    ${element_age}>${ChildAge}    Log    Sorted children age is : ${element_age}    ELSE    Fail    Site show children out of filter applied        
    END

To select children through gender filter
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child 
    Wait Until Element Is Visible    class=gbl_banner_content    60s  
    BySpecific Selected By Default  
    Most Needed Child Selected By Default
    Execute JavaScript    window.scrollTo(0, 400)
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//label[@for='gender-boy']/span[1] 
    Run Keyword If    '${status}'!='True'    Fail    There is no child currently or Boy gender is not available
    ${gender}=    Get Text    xpath=//label[@for='gender-boy']/span[1]
    ${gender}=    Replace String    ${gender}    B    b
    Click Element    xpath=//label[@for='gender-boy']/span[1]      
    Sleep    15s
    # Wait Until Element Is Visible    xpath=//li[@class='pager__item']/a    60s
    # Click Element    xpath=//li[@class='pager__item']/a                
    ${gender_count}=    Get Element Count    xpath=//div[@class='bySpecContHolder']//p/span[contains(text(),'${gender}')]
    Log To Console    No of childrens found: ${gender_count}
    FOR    ${element}    IN RANGE    1    ${gender_count}+1
        Mouse Over    xpath=(//div[@class='bySpecHoverContent'][1])[${element}]
        ${gender_got}=    Get Text    xpath=(//div[@class='bySpecContHolder']//p/span[contains(text(),'${gender}')])[${element}]    
        Run Keyword If    '${gender_got}'!='${gender}'    Fail    "Sorted was not based on the given gender"        
    END

To verify uncheck and check allow auto debit It should lead to SI flow
    [Tags]    SI Flow
        
    Jenkins browser launch
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    End Child Sexual Abuse
    Sleep    15s    
    Click Element    xpath=.//div[@class='item-image']//img
    Wait Until Element Is Visible    xpath=//div[@class='inner_banner_pledge_content']/h2/div/p    60s
    ${camp_name}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div/p
    ${label_val}=    Get Text    xpath=//label[contains(text(),'3 Months')]
    ${final_val}=    Get Substring    ${label_val}    9    16
    Log To Console    Final val is:${final_val}
    Click Element    xpath=//label[contains(text(),'3 Months')]
    Click SI CheckBox 
    Add to cart text change    
    Click SI CheckBox
    Proceed To Autopay Text Check    
    Proceed to Pay Button 
    SI login
    SI payment gateway check

Password should be displayed in masked format rather than showing actual text format
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name    
    Input Text    id=edit-name    username    
    Click Element    id=edit-pass    
    Input Text    id=edit-pass    DummyPassword
    Capture Page Screenshot    
    ${password_status}=    Get Element Attribute    id=edit-pass    type
    Run Keyword If    '${password_status}'=='password'    Log To Console    'Password is in masked format'    ELSE    Fail    'Password is not in masked format'

To sponsor a Help HIV aids Campaign as a one time donation using Checkout flow
    [Tags]    Help Hiv aids Campaign
    
    Jenkins browser launch
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    HIV & AIDS
    ${camp_name}    ${Camp_val}    one time campaign - Help HIV aids Campaign
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}  
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}

To sponsor a Protect Girl Children Campaign using Checkout flow
    [Tags]    Protect Girl Children Campaign

    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    End Child Sexual Abuse
    Sleep    5s    
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}

# To sponsor a Protect Girl Children Campaign using Checkout flow
    # Jenkins browser launch
    # Click Element    xpath=.//a[contains(.,'My Gifts')]
    # Banner Alert
    # ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    # ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    # Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    # Mouser hover ways to give campaign    End Child Sexual Abuse
    # Sleep    5s
    # Click Element    xpath=.//div[@class='item-image']//img
    # ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    # Click Element    id=ChkForSI
    # Sleep    10s    
    # ${label_val}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    # ${Camp_amt}=    Get Substring    ${label_val}    9    16
    # Log To Console    Final val is: ${camp_amt}
    # Sleep    15s   
    # Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    
    # Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    # Click Element    xpath=//a[@class='view_cart']
    # ${view_cart_amount}=    Get Text    xpath=//td[@class='views-field views-field-total-price__number views-align-center']
    # Log To Console    View cart page campaign amount: ${view_cart_amount}
    # check in view cart page    ${camp_name}    ${camp_amt}
    # View cart proceed button
    # Login
    # CCavenue payment success flow


To Verify title select from the options provided in th the dropdown
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]
    FOR    ${element}    IN    @{registration_title}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-title 
        Run Keyword If    '${status}'=='True'    Select From List By Label    id=edit-field-title    ${element}    ELSE    Fail    "${element} is not in title dropdown"
    END
    
To Verify User should submit the form without entering any details
    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'About Us')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Contact Us')] 
    Sleep    30s    
    Scroll Element Into View    id=edit-actions-submit
    Click Element    id=edit-actions-submit    
    FOR    ${element}    IN    @{alert_list}
        ${alert}=    Run Keyword And Return Status    Element Should Be Visible    id=${element}
        Run Keyword If    'True'!='${alert}'    Fail    "${element} name alert not display"          
    END    

To Verify User should submit the form without entering any details - End Child sexual abuse Page
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouser hover ways to give campaign    End Child Sexual Abuse 
    Sleep    30s    
    Scroll Element Into View    id=edit-actions-submit
    Click Element    id=edit-actions-submit    
    FOR    ${element}    IN    @{alert_list}
        ${alert}=    Run Keyword And Return Status    Element Should Be Visible    id=${element}
        Run Keyword If    'True'!='${alert}'    Fail    "${element} name alert not display"          
    END 
    
To sponsor a Help Hiv aids Campaign using Checkout flow
    [Tags]    Help Hiv aids Campaign        
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete            
    Mouser hover ways to give campaign    HIV & AIDS
    Sleep    5s            
    ${camp_name}    ${camp_amt}    Checkout flow campaign - HIV
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow 
    CCavenue payment - cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}          
    
To verify gallery and recent videos in my child page
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]
    Sleep    20s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//h2[@class='savegallry-head']/span[contains(text(),'Gallery')]       
    Run Keyword If    'True'!='${status}'    Fail    "Gallery section was not loading in mychild page"    ELSE    Log To Console    "Gallery section loading successfully"
    @{galary_img}=    Get WebElements    xpath=//div[@class='child-gallery']//img
    FOR    ${element}    IN    @{galary_img}
        ${image}=    Get Element Attribute    ${element}    title
        Log To Console    Images displaying in My child page are: ${image}    
    END
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//h2[@class='savegallry-head']/span[contains(text(),'Recent Video')]       
    Run Keyword If    'True'!='${status}'    Fail    "Recent video section was not loading in mychild page"    ELSE    Log To Console    "Recent video section loading successfully"
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='sponsor_header']/img       
    Run Keyword If    'True'!='${status}'    Fail    "Recent video was not uploaded in mychild page"    ELSE    Log To Console    "Recent video was uploaded in mychild page"
    Click Element    xpath=//div[@class='sponsor_header']/img     
    
To Verify User should submit the form without entering any details - HungerFree page
    [Tags]    Hunger Free Campaign
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouser hover ways to give campaign    Hungerfree 
    Sleep    30s    
    Scroll Element Into View    id=edit-actions-submit
    Click Element    id=edit-actions-submit    
    FOR    ${element}    IN    @{HungerFree_alert}
        ${alert}=    Run Keyword And Return Status    Element Should Be Visible    id=${element}
        Run Keyword If    'True'!='${alert}'    Fail    "${element} name alert not display"          
    END 
    
To verify child profile
    [Tags]    MyChild Page
    
    Jenkins browser launch
    Navigation banner close
    Click Login
    Direct login
    Click MyChild
    Sleep    20s    
    Click Element    xpath=(//div[@class='child_name heartbeat'])[1]
    Verify MyChild Menu 
    Click MyProfile In MyChild Page
    ${sponsor_amt}=    Get Text    xpath=//div[contains(@class,'sponsorship-amount')]/p
    ${Payment_Frequency}=    Get Text    xpath=//div[contains(@class,'Payment-period')]/p[1]
    ${Child_Image}=    Get Element Attribute    xpath=//div[@class='child-image']/img    src        
    Log To Console    Sponsored amount is: ${sponsor_amt}, Payment frequency for the child is: ${Payment_Frequency} and child image are at: ${Child_Image}
    Click Element    xpath=//p[contains(text(),'PROJECT METER')]
    ${adp}=    Get Text    xpath=//div[contains(@class,'proj_id')]    
    ${adp} =    Remove String Using Regexp    ${adp}    \1.*$
    Log To Console    Area development details: ${adp}    

To verify schedule a call
    [Tags]    MyChild Page
        
    Jenkins browser launch
    Navigation banner close
    Click Login
    Direct login
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]
    Click Element    xpath=(//div[@class='child_title'])[1]    
    ${schedule_call}=    Get Text    xpath=//div[contains(@class,'call-schedule')]/a/p    
    Run Keyword If    'Schedule a Call'=='${schedule_call}'    Log To Console    "Schedule call option is enabled"    ELSE    Fail    "Schedule call options is not enabled"
    Click Element    xpath=//div[contains(@class,'call-schedule')]/a/p
    
    ${CurrentDate}=    Get Current Date    result_format=%Y-%b-%d
    ${month}=    Get Substring    ${CurrentDate}    5    8
    
    Sleep    5s    
    Click Element    xpath=//input[@class='scheduleavcdate hasDatepicker']
    Sleep    5s        
    Select From List By Label    class=ui-datepicker-month    ${month}
    Select From List By Label    class=ui-datepicker-year    2021
    Click Element    xpath=//td[contains(@class,' ui-datepicker-days-cell-over ')]/a    
    #Click Element    xpath=//table[@class='ui-datepicker-calendar']//tbody/tr/td/a[text()='${datetime.day}']        
    Click Element    class=scheduleavctime
    Click Element    xpath=//a[text()='10:00:00']      
    Click Element    xpath=(//label[@class='disableclick'])[2]    
    Click Element    xpath=//a[contains(@class,'sendcallrequest')]

To verify Confirm password and Re-confirm password should be displayed in masked
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]    
    #confirm password
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[text()='Password']    
    Input Text    id=edit-pass-pass1    dummuPass
    #Re-confirm password
    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[text()='Confirm Password']
    Input Text    id=edit-pass-pass2    dummyPass
    Capture Page Screenshot
    ${password_status}=    Get Element Attribute    id=edit-pass-pass1    type
    Run Keyword If    '${password_status}'=='password'    Log To Console    'Password is in masked format'    ELSE    Fail    'Password is not in masked format'
    ${password_status}=    Get Element Attribute    id=edit-pass-pass2    type
    Run Keyword If    '${password_status}'=='password'    Log To Console    'Confirm Password is in masked format'    ELSE    Fail    'Confirm Password is not in masked format'


To sponsor single child - SI flow - By specific section
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child
    Sleep    15s        
    BySpecific Selected By Default
    Most Needed Child Selected By Default

    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]    
    ${child_details}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]/p
    ${child_location}=    Get Text    xpath=(//div[@class='bySpecLocation'])[1]/p        

    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]      
    Child Name Verify BySpecific page    ${Child_name}
    9600 Amount Button Verify BySpecific page    
    SI Checkbox verify BySpecific page    
    Child Quantity default verify BySpecific page    
    Proceed to Pay Button    
    SI login
    Sleep    10s    
    SI payment gateway check

To Sponsor a child-SI flow - Any child section
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child
    Sleep    15s
    Click Any Child BySpecific Page
    ${child_name}=    Get Text    xpath=(//div[@class='overall_banner_pledge'])[3]/div[2]/h2  
    9600 Amount Button Verify BySpecific page  
    SI Checkbox verify BySpecific page
    Child Quantity default verify BySpecific page
    Proceed to Pay Button
    SI login
    Sleep    10s    
    SI payment gateway check

To verify increment/decrement functionality
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}        
    Log To Console    ${get_viewcart_list_count}    
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}        
    
    #One Time Donation
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    Click Element    xpath=.//div[@class='item-image']//img
    #Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Sleep    5s    
    Click Element    id=ChkForSI
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    Click Element    xpath=//a[@class='view_cart']
    ${add_button}=    Run Keyword And Return Status    Element Should Not Be Visible    class=save-plus        
    Run Keyword If    'True'=='${add_button}'    Log To Console    "Plus button is not available for one time donation"    ELSE    Fail    "Plus button is available for one time donation"
    ${reduce_button}=    Run Keyword And Return Status    Element Should Not Be Visible    class=save-plus        
    Run Keyword If    'True'=='${reduce_button}'    Log To Console    "Reduce button is not available for one time donation"    ELSE    Fail    "Reduce button is available for one time donation"            

    #Recuring Payment
    Sleep    10s    
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    ${get_viewcart_list_count}=    Get Element Count    xpath=.//tbody/tr/td[starts-with(@headers,'view-product-')]
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}        
    Log To Console    ${get_viewcart_list_count}    
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep    15s
    Wait Until Element Is Visible    xpath=(//div[@class='price save-malnourished-cart-sec'])[1]/label    15s    
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[1]/label
    Click Element    id=ChkForSI
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    Click Element    xpath=//a[@class='view_cart']    
    Cart addition check
    Cart reduce check

To Verify Postal Code Field should Auto populate
    [Tag]   Registration Page

    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]     
    Sleep    10s          
    Scroll Element Into View    class=singUpRegister    
      
    Input Text    xpath=//input[contains(@id,'edit-field-pin-code')]    600123  
    
    Sleep    10s        

    ${city}=    Get Element Attribute    id=edit-field-city-0-value    value
    Log To Console    City ${city} is auto populated    
    ${state}=    Get Element Attribute    id=edit-field-regstate-0-value    value
    Log To Console    state ${state} is auto populated
    ${country}=    Get Element Attribute    id=edit-field-country    value
    Log To Console    Country ${country} is auto populated

To verify schedule a visit
    [Tags]    MyChild Page
    
    Jenkins browser launch
    Click Login
    Direct login
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]
    Click Element    xpath=(//div[@class='child_title'])[1]
    
    ${schedule_call}=    Get Text    xpath=//div[contains(@class,'visit-schedule')]/a/p    
    Run Keyword If    'Schedule a Visit'=='${schedule_call}'    Log To Console    "Schedule a Visit option is enabled"    ELSE    Fail    "Schedule a Visit options is not enabled"
    Click Element    xpath=//div[contains(@class,'visit-schedule')]/a/p
    ${CurrentDate}=    Get Current Date    result_format=%Y-%b-%d
    ${month}=    Get Substring    ${CurrentDate}    5    8
    
    Sleep    10s    
    Click Element    xpath=//input[@class='schedulevisitdate hasDatepicker']    
    Select From List By Label    class=ui-datepicker-month    ${month}
    Select From List By Label    class=ui-datepicker-year    2021
    Click Element    xpath=//td[contains(@class,' ui-datepicker-days-cell-over ')]/a
    #Click Element    xpath=//table[@class='ui-datepicker-calendar']//tbody/tr/td/a[text()='${datetime.day+7}']        
    Click Element    xpath=//input[@class='schedulevisittime']
    Click Element    xpath=//a[text()='10:00:00']        
    Click Element    xpath=(//label[@class='disableclick'])[1]    
    Click Element    xpath=//a[contains(@class,'sendrequest')]

To verify write a message
    [Tags]    MyChild Page
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]
    Click Element    xpath=(//div[@class='child_title'])[1]
    Click Element    xpath=(//div[@class='child_name heartbeat'])[1]
    
    @{child_details}=    Get WebElements    xpath=//ul[@class='tab-mnu']/li/p
    FOR    ${element}    IN    @{child_details}
        ${text}=    Get Text    ${element}
        Log To Console    Details enabled for child:    ${text}    
    END
    
    ${write_msg}=    Get Text    xpath=//div[contains(@class,'message-sec')]/p    
    Run Keyword If    'Write a Message'=='${write_msg}'    Log To Console    "Write a message option is enabled"    ELSE    Fail    "Write a message options is not enabled"
    
    ${child_name}=    Get Text    xpath=//div[@id='edit-messageheader']/div[@class='childsname']
    ${Child_image}=    Get Element Attribute    xpath=//div[@id='edit-messageheader']/div[@class='childspic']/img    src

    Click Element    xpath=//div[contains(@class,'message-sec')]/p    
    
    Click Element    id=edit-user-message    
    Input Text    id=edit-user-message    Test message for child
    Sleep    5s    
    ${child_msg}=    Get Text    id=user_message
    Run Keyword If    'Test message for child'=='${child_msg}'    Log To Console    "Message populate same as like written'    ELSE    Fail    "Message was not same as like written"

To verify offline - Cheque & DD acknowledgement page
    [Tags]    Payment Acknowlodgement for Indian Passport Holder
        
    Jenkins browser launch
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children     
    ${camp_name}    ${camp_val}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${Camp_val}           
    View cart proceed button 
    Sleep    10s   
    Click Element    xpath=//input[@id='edit-payment-information-payment-method-offline-payment']    
    Scroll Element Into View    class=upihead
    Offline Payment Option    Cheque & DD        
    Sleep    10s 
    Click Element    id=off-edit-actions-next    
    CCavenue payment - cart verification    ${camp_name}    ${camp_val}    ${cart_quanity}

To verify offline - UPI acknowledgement page
    [Tags]    Payment Acknowlodgement for Indian Passport Holder
        
    Jenkins browser launch
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children     
    ${camp_name}    ${camp_val}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${Camp_val}           
    View cart proceed button 
    Sleep    10s   
    Click Element    xpath=//input[@id='edit-payment-information-payment-method-offline-payment']    
    Scroll Element Into View    class=upihead        
    Offline Payment Option    UPI
    Sleep    10s 
    Click Element    id=off-edit-actions-next    
    CCavenue payment - cart verification    ${camp_name}    ${camp_val}    ${cart_quanity}

To verify offline - Paytm acknowledgement page
    [Tags]    Payment Acknowlodgement for Indian Passport Holder
    
    Jenkins browser launch
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children     
    ${camp_name}    ${camp_val}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${Camp_val}           
    View cart proceed button 
    Sleep    10s   
    Click Element    xpath=//input[@id='edit-payment-information-payment-method-offline-payment']    
    Scroll Element Into View    class=upihead
    Offline Payment Option    Paytm
    Sleep    10s 
    Click Element    id=off-edit-actions-next    
    CCavenue payment - cart verification    ${camp_name}    ${camp_val}    ${cart_quanity}

To verify offline - Bank transfer acknowledgement page
    [Tags]    Payment Acknowlodgement for Indian Passport Holder
    
    Jenkins browser launch
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children     
    ${camp_name}    ${camp_val}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${Camp_val}           
    View cart proceed button 
    Sleep    10s   
    Click Element    xpath=//input[@id='edit-payment-information-payment-method-offline-payment']    
    Scroll Element Into View    class=upihead        
    Offline Payment Option    Bank Transfer
    Sleep    10s 
    Click Element    id=off-edit-actions-next    
    CCavenue payment - cart verification    ${camp_name}    ${camp_val}    ${cart_quanity}
    
To Verify confirm password Field minimum length registration page
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Register')]    
       
    #confirm password
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    password@123
    
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    id=edit-pass-pass1-error        
    Run Keyword If    '${status}'=='True'    Log To Console    Page doesnt throughs error message for password minimum length    ELSE    Fail    Page throughs error message for password minimum length
        
    Clear Element Text    id=edit-pass-pass1
    Click Element    //label[@for='edit-pass-pass1']
    Input Text    id=edit-pass-pass1    pas
        
    Click Element    //label[@for='edit-pass-pass2']

    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-pass-pass1-error        
    Run Keyword If    '${status}'=='True'    Log To Console    Page throughs error message for password minimum length    ELSE    Fail    Page doesnt throughs error message for password minimum length

To Verify User should submit the form without the Captcha
    [Tags]  Contacts Us page
    
    Jenkins browser launch
    Navigation banner close   
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'About Us')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Contact Us')] 
    Sleep    15s    
    Scroll Element Into View    id=edit-actions-submit
    Input Text    id=edit-name-    testname
    Input Text    id=edit-email-    test@test.com
    Input Text    id=edit-contact-    9999999999
    Click Element    id=edit-query-type-styled
    Click Element    xpath=//a[text()='Sponsorship']    
    Input Text    id=edit-message    Dummy message to test Text box1$        
    Click Element    id=edit-actions-submit 
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//strong[@id='g-recaptcha-response-error']        
    Run Keyword If    '${status}'=='True'    Log    "Recaptcha error message appeared"    ELSE    Fail    "Recaptcha error message doesnt appeared"

To Verify User should submit the form without the Captcha - End Child sexual abuse Page 
    Jenkins browser launch
    Navigation banner close   
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login    
    Mouse Over    xpath=//li/span[contains(.,'Ways to Give')]
    Click Element    xpath=//li/a[contains(.,'End Child Sexual Abuse')]
    Sleep    15s    
    Scroll Element Into View    id=edit-actions-submit
    Input Text    id=edit-name-    testname
    Input Text    id=edit-email-    test@test.com
    Input Text    id=edit-contact-    9999999999
    Click Element    id=edit-query-type-styled
    Click Element    xpath=//a[text()='Sponsorship']    
    Input Text    id=edit-message    Dummy message to test Text box1$        
    Click Element    id=edit-actions-submit 
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//strong[@id='g-recaptcha-response-error']        
    Run Keyword If    '${status}'=='True'    Log    "Recaptcha error message appeared"    ELSE    Fail    "Recaptcha error message doesnt appeared"

To Verify Special Character should not accept except Email Address, Confirm pass
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Register')]    
       
    #confirm password
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    newpassword
    
    #Re-confirm
    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[@for='edit-pass-pass2']
    Input Text    id=edit-pass-pass2    newpassword
    
    ${password1}=    Get Element Attribute    id=edit-pass-pass1    value
    ${password2}=    Get Element Attribute    id=edit-pass-pass2    value    
    Sleep    5s    
    
    Run Keyword If    '${password1}'=='${password2}'    Element Should Be Visible    xpath=//p[@class='wrong right']    ELSE    Fail    Password macthed icon doesnt show
    
    #confirm password
    Clear Element Text    id=edit-pass-pass1
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    newpassword
    
    #Re-confirm
    Clear Element Text    id=edit-pass-pass2
    Click Element    //label[@for='edit-pass-pass2']
    Input Text    id=edit-pass-pass2    passwordnew 
    
    ${password1Wrong}=    Get Element Attribute    id=edit-pass-pass1    value
    ${password2Wrong}=    Get Element Attribute    id=edit-pass-pass2    value
    Sleep    5s   
    
    Run Keyword If    '${password1Wrong}'!='${password2Wrong}'    Element Should Be Visible    xpath=//p[@class='wrong']    ELSE    Fail    Password mismatch icon doesnt show
    
To verify child project meter
    [Tags]    MyChild Page
    
    Jenkins browser launch
    Click Login
    Direct login
    Click MyChild
    Wait Until Element Is Visible    xpath=(//div[@class='child_name heartbeat'])[1]    60s
    Click Element    xpath=(//div[@class='child_name heartbeat'])[1]
    Child Details 3 Menus
    Click Project Meter
    ${location}=    Get Text    xpath=//div[@class='proj_id']
    Should Not Be Empty    ${location}    
    ${from_date}=    Get Text    xpath=//div[contains(@class,'projmeter-date')]/p[2]    
    Should Not Be Empty    ${from_date}
    ${to_date}=    Get Text    xpath=//div[contains(@class,'projmeter-unit')]/p[2]    
    Should Not Be Empty    ${to_date}
    Log To Console    Location is: ${location}, From date is: ${from_date} and To date is: ${to_date}

To Verify User should submit the form Using Invalid Email ID
    [Tags]    Contacts Us page

    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'About Us')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Contact Us')] 
    Sleep    15s    
    FOR    ${element}    IN    @{email_validation}
        Clear Element Text    id=edit-email-
        Input Text    id=edit-email-    ${element}
        Click Element    id=edit-actions-submit
        Sleep    5s    
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-email--error    
        Run Keyword If    '${status}'!='True'    Fail    Alert message was not displayed
    END    
    ${title}=    Get Title   
    Run Keyword If    'Contact Us | World vision'!='${title}'    Fail    'Form was submitted'    ELSE    Log To Console    form was not submitted

To Verify User should submit the form Using Invalid Email ID - End Child sexual abuse Page
    [Tags]    End Child Sexual Abuse campaign
    
    Jenkins browser launch
    Navigation banner close   
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login    
    Mouse Over    xpath=//li/span[contains(.,'Ways to Give')]
    Click Element    xpath=//li/a[contains(.,'End Child Sexual Abuse')] 
    Sleep    15s    
    FOR    ${element}    IN    @{email_validation}
        Clear Element Text    id=edit-email-
        Input Text    id=edit-email-    ${element}
        Click Element    id=edit-actions-submit
        Sleep    5s    
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-email--error    
        Run Keyword If    '${status}'!='True'    Fail    Alert message was not displayed
    END    
    ${title}=    Get Text    xpath=//div[contains(@class,'gbl_banner_content')]//h2
    Run Keyword If    'End Child Sexual Abuse'!='${title}'    Fail    'Form was submitted'    ELSE    Log To Console    form was not submitted    
    

To sposor a Emergency Relief Campaign using Checkout flow
    [Tags]    Emergency Relief Campaign
    
    Jenkins browser launch
    Navigation banner close

    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}            
    Mouser hover ways to give campaign    Emergency Relief
    Sleep    5s
    @{emergency_relief}=    Get WebElements    xpath=//h5[@class='campaign-title']/a
    FOR    ${element}    IN    @{emergency_relief}
        ${text}=    Get Text    ${element}
        Log To Console    Current Emergencey reliefs are: ${text}        
    END 
    
    Wait Until Element Is Visible    xpath=//a[text()='Kerala Floods']/ancestor::h5/following-sibling::p[2]/a    40s
    Click Element    xpath=//a[text()='Kerala Floods']/ancestor::h5/following-sibling::p[2]/a
        
    Wait Until Element Is Visible    xpath=.//div[@class='item-image']//img    40s
    Click Element    xpath=.//div[@class='item-image']//img
    
    ${campaign_name}    ${campaign_amt}    Kerala flood campaign    1
    ${campaign_name2}    ${campaign_amt2}    Kerala flood campaign    2        
    
    Add to cart functionality
    Clear and input text    1000
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']/input   
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//a[@class='view_cart'] 

    ${cart_quanity}    check in view cart page - dynamic    ${campaign_name}    ${campaign_amt}
    ${cart_quanity2}    check in view cart page - dynamic    ${campaign_name2}    ${campaign_amt2}    
    ${cart_quanity3}    check in view cart page - dynamic    Donation    1000
    
    ${total_calc}=    Evaluate    ${campaign_amt}+${campaign_amt2}+1000

    ${total_cart_value}    Total cart value
    
    Should Be Equal As Integers    ${total_calc}    ${total_cart_value}    

    View cart proceed button
    Login
    CCavenue payment success flow
    
    CCavenue payment - cart verification - dynamic    ${campaign_name}    ${campaign_amt}    ${cart_quanity}
    CCavenue payment - cart verification - dynamic    ${campaign_name2}    ${campaign_amt2}    ${cart_quanity2}
    CCavenue payment - cart verification - dynamic    Donation    1000    ${cart_quanity3}

To verify Events functionality
    [Tags]    Events Page
    
    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Get Involved')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Events')]
    Wait Until Element Is Visible    id=recent-evnt    30s
    ${status}=    Get Element Attribute    id=recent-evnt    class
    Run Keyword If    '${status}'!='active'    Fail    Recent event was not selected by default
    
    ${event_count}=    Get Element Count    xpath=//div[@class='first_blog_title checking']
    FOR    ${element}    IN RANGE    1    ${event_count}+1
        ${events}=    Get Text    xpath=(//div[@class='first_blog_title checking'])[${element}]
        ${day}=    Get Text    xpath=(//span[@class='blog_dates'])[${element}]
        ${month}=    Get Text    xpath=(//span[@class='first_blog_month'])[${element}]
        ${year}=    Get Text    xpath=(//span[contains(@class,'first_blog_year')])[${element}]              
        Log To Console    Past and current event name is: ${events} and its date is ${day}/${month}/${year}    
    END    
    
    #Run Keyword If    ${year}>=2021 and ${month}<='current-month' and ${day}<'current day'
    Click Element    id=upcmg-evnt
    Sleep    10s        
    ${event_count}=    Get Element Count    xpath=//div[@class='first_blog_title checking']
    FOR    ${element}    IN RANGE    1    ${event_count}+1
        ${events}=    Get Text    xpath=(//div[@class='first_blog_title checking'])[${element}]
        ${day}=    Get Text    xpath=(//span[@class='blog_dates'])[${element}]
        ${month}=    Get Text    xpath=(//span[@class='first_blog_month'])[${element}]
        ${year}=    Get Text    xpath=(//span[contains(@class,'first_blog_year')])[${element}]              
        Log To Console    Future event name is: ${events} and will be held on ${day}/${month}/${year}    
    END

To check whether the filters work properly in Blog page
    [Tags]    Media
    
    Jenkins browser launch
    Navigation banner close    
    Event Page menu check    Blog
    Event Submenu Check    Blog
    Scroll Element Into View    xpath=//input[contains(@id,'edit-submit-press-releases')]
    Select From List By Label    id=edit-field-month-target-id    ${month_input}
    Select From List By Label    id=edit-field-releases-year-target-id    ${year_input}    
    Click Element    xpath=//input[contains(@id,'edit-submit-press-releases')]
    Sleep    40s
    ${month_sort}=    Get Substring    ${month_input}    0    3
    #Element Should Be Visible    xpath=//div[@class='media-press-page pressres']    
    ${month}=    Get Text    xpath=//div[@class='save-child-image_container']//span[@class='first_blog_month']
    Run Keyword If    '${month_sort}'!='${month}'    Fail    Month mismatch or No data found
    ${year}=    Get Text    xpath=//div[@class='save-child-image_container']//span[@class='first_blog_year']
    Run Keyword If    '2020'!='${year}'    Fail    Month mismatch or No data found

To check with the filters in news articles page
    [Tags]    Media
    
    Jenkins browser launch
    Navigation banner close    
    Event Page menu check    News Articles
    Event Submenu Check    News Articles
    Event page filter    ${month_input}    2019    ${language_input}               
    ${month_sort}=    Get Substring    ${month_input}    0    3                
    #Scroll Element Into View    id=edit-subscribe
    Sleep    10s    
    Scroll Element Into View    xpath=//div[@class='media-press-page']//span[@class='media-mont']
    ${month}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='media-press-page']//span[@class='media-mont' and contains(text(),'${month_sort}')]           
    Run Keyword If    'True'!='${month}'    Fail    Month mismatch or No data found
    ${year}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='media-press-page']//span[@class='media-year' and contains(text(),'2019')]
    Run Keyword If    'True'!='${year}'    Fail    Year mismatch or No data found

To check with the filters in press release page
    [Tags]    Media
    
    Jenkins browser launch
    Navigation banner close    
    Event Page menu check    Press Releases
    Event Submenu Check    Press Releases
    Event page filter    ${month_input}    ${year_input}    ${language_input}
    Sleep    15s   
    Event page filter verification    ${month_input}    ${year_input}

To Verify User should submit the form with Mandatory data - Hungerfree
    [Tags]    Hunger Free Campaign
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouser hover ways to give campaign    Hungerfree 
    Sleep    30s    
    Scroll Element Into View    id=edit-actions-submit
    
    Input Text    id=edit-name    testname
    Click Element    id=edit-date-of-birth    
    Select From List By Label    class=ui-datepicker-year    1989
    Select From List By Label    class=ui-datepicker-month    May
    Click Element    xpath=//a[text()='11']
    #Click Element    id=edit-state    
    Select From List By Index    id=edit-state    4
    Input Text    id=edit-email    test@testa.com
    Input Text    id=edit-mobile-number    9999999997

    Click Element    id=edit-actions-submit        

    ${message}=    Get Text    xpath=//div[@class='thanks_description']/h1
    Run Keyword If    '${message}'=='Thank You'    Log To Console    Form submitted successfully    ELSE    Fail    Form was not submitted   

To Verify User should submit form with Valid Sponsor ID
    [Tags]    Contacts Us page
    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'About Us')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Contact Us')] 
    Sleep    10s    
    Click Element    xpath=//label[@for='edit-are-you-a-partner-y']    
    Input Text    id=edit-partner-id    asldkalsdglas
    Click Element    id=edit-actions-submit
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-partner-id-error    
    Run Keyword If    '${status}'!='True'    Fail    Alert message was not displayed
    ${title}=    Get Title   
    Run Keyword If    'Contact Us | World vision'!='${title}'    Fail    'Form was submitted'    ELSE    Log To Console    form was not submitte


To Verify User should submit form with Valid Sponsor ID - End Child sexual abuse Page  
    [Tags]    End Child Sexual Abuse campaign

    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Ways to Give')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'End Child Sexual Abuse')] 
    Sleep    10s    
    Click Element    xpath=//label[@for='edit-are-you-a-partner-y']    
    Input Text    id=edit-partner-id    asldkalsdglas
    Click Element    id=edit-actions-submit
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-partner-id-error    
    Run Keyword If    '${status}'!='True'    Fail    Alert message was not displayed    
    ${title}=    Get Text    xpath=//div[contains(@class,'gbl_banner_content')]//h2
    Run Keyword If    'End Child Sexual Abuse'!='${title}'    Fail    'Form was submitted'    ELSE    Log To Console    form was not submitted    
    
To Verify welcome banner should appear for Donor on Second login
    [Tags]    Myworld Page    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login    
    Sleep    10s    
    Welcome user banner text    Welcome

To Verify Upcomming Events Banner Functionallity appear by selecting loaction
    [Tags]    Myworld Page    

    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login    
    Wait Until Element Is Visible    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[@aria-label='Go to slide 1']    60s    
    Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[@aria-label='Go to slide 1']
    Click Element    xpath=//a[text()='Locate Event']    
    
    ${location}=    Get Text    xpath=(//div[@class='evt_ltn_stry'])[2]
    Run Keyword If    'Chennai'!='${location}    Fail    Event was not showing based on the location

To verify payment success for ccavenue payment gateway - For other passport holder
    [Tags]    Payment acknowledgment for other passport holder
        
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login - Other passport user    
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete                
    Mouse hover ways to give after login    Educate Children
    Sleep    10s
    ${camp_name}    ${camp_amt}    Other Passport Flow
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button    
    Hdfc bank payment gateway check           
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//input[contains(@id,'edit-payment-information-payment-method')]/following-sibling::span[contains(text(),'${checkout_payment_list_text}[2]')]
    Run Keyword If    '${status}'=='True'    Click Element    xpath=//span[contains(text(),'POWERED BY HDFC BANK')]//preceding-sibling::input    ELSE    Log    POWERED BY HDFC BANK is not dispalyed
    Sleep    20s    
    Click Element    xpath=//div[@id='edit-actions']/button[contains(text(),'pay my contribution')]    
    Wait Until Element Is Visible    xpath=//li[contains(text(),'Pay with')]    30s    
    Click Element    xpath=//li[contains(text(),'Pay with')]    
    Sleep    5s        
    Mouse Over    id=hdfc_credit
    Click Element    id=hdfc_credit
    Sleep    5s      

    Input Text    class=cardNumber    5555 5555 5555 5555
    Input Text    id=name    Test name
    Select From List By Index    id=expMonthSelect    6
    Select From List By Index    id=expYearSelect    4        
    Input Text    id=cvv_no    123    
    
    # ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    # Run Keyword If    3!=${checkout_payment_list}    Fail    "Checkout flow Other passport holder payment list are mismatch"
    # FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        # ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        # Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Other passport holder Payment Gateway ${bank_txt} text is mismatch'    ELSE    Log To Console    Payment gateway lists are matching    
    # END
    # ${camp_amt}=    Convert to price    ${camp_amt}
    # CCavenue payment success flow
    # CCavenue payment - cart verification - dynamic    ${camp_name}    ${camp_amt}    ${cart_quanity}

To Sponsor 3 child - Direct flow – byspecific
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Cart campaign check and delete
    Mouse Over    xpath=//div[@class='main-menu-inner']//li/span[contains(.,'Explore More')]
    Click Element    xpath=//div[@class='main-menu-inner']//a[contains(.,'Sponsor a Child')]
    
    ${by_specific}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[contains(@class,'checked')]   
    Run Keyword If    '${by_specific}'=='True'    Log To Console    "By specific is selected by default"    ELSE    Fail    "By specific was not selected by default"
    
    ${most_needed}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='gbl_tabbed_menu']//li[contains(@class,'most-needed active')]
    Run Keyword If    '${most_needed}'=='True'    Log To Console    "Most Needed is selected by default"    ELSE    Fail    "Most Needed was not selected by default"
    
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]    
    ${child_details}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]/p
    ${child_location}=    Get Text    xpath=(//div[@class='bySpecLocation'])[1]/p    
    
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    
    ${child_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='overall_banner_pledge'][1]/div[2]/h2[contains(text(),'${Child_name}')]
    Run Keyword If    'True'=='${child_status}'    Log To Console    "Child found in popup menus"    ELSE    Fail    "Child is mismatching in popup menu"
    
    ${recurring_payments}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=(//input[@id='ChkForSI'])[1]
    Run Keyword If    'True'=='${recurring_payments}'    Log To Console    "Please use my card details for recurring payments is selected by default"    ELSE    Fail    "Please use my card details for recurring payments is not selected by default"
    
    ${more_childrens}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '0'=='${more_childrens}'    Log To Console    "Sponsor More Children is 0 by default "    ELSE    Fail    "Sponsor More Children is not 0 by default"
   
    #select child amount
    ${camp_amt}=    Get Text    xpath=(//label[contains(text(),'1 Month')])[1]
    ${camp_amt}=    Convert to price    ${camp_amt}    

    Click Element    xpath=(//label[contains(text(),'1 Month')])[1]
    Click Element    id=ChkForSI    
    Add to cart text change    
    #sponsor child count
    FOR    ${element}    IN RANGE    0    3
        Click Element    xpath=(//div[@id='sip_increase'])[1]    
    END    
    ${child_count}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '2'!='${child_count}'    Fail    Sponsored Child count doesnt macth
    
    #Add to cart buttton
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']/input
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//div[@class='cart-buttons']/a[2]    
    
    ${cart_quanity}=    check in view cart page - Checkout flow    ${Child_name}    ${camp_amt}    
    View cart proceed button
    CCavenue payment success flow
    CCavenue payment - cart verification    ${Child_name}    ${camp_amt}    ${cart_quanity}
    

To Sponsor 5 child - SI flow - byspecific
    [Tags]    Sponsor a Child
    
    Jenkins browser launch
    Banner Alert        
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Cart campaign check and delete
    Mouse Over    xpath=//div[@class='main-menu-inner']//li/span[contains(.,'Child Sponsorship')]
    Click Element    xpath=//div[@class='main-menu-inner']//a[contains(.,'Sponsor a Child')]
    
    ${by_specific}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[contains(@class,'checked')]   
    Run Keyword If    '${by_specific}'=='True'    Log To Console    "By specific is selected by default"    ELSE    Fail    "By specific was not selected by default"
    
    ${most_needed}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='gbl_tabbed_menu']//li[contains(@class,'most-needed active')]
    Run Keyword If    '${most_needed}'=='True'    Log To Console    "Most Needed is selected by default"    ELSE    Fail    "Most Needed was not selected by default"
    
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]    
    ${child_details}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]/p
    ${child_location}=    Get Text    xpath=(//div[@class='bySpecLocation'])[1]/p    
    
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    
    ${child_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='overall_banner_pledge'][1]/div[2]/h2[contains(text(),'${Child_name}')]
    Run Keyword If    'True'=='${child_status}'    Log To Console    "Child found in popup menus"    ELSE    Fail    "Child is mismatching in popup menu"
    
    ${recurring_payments}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=(//input[@id='ChkForSI'])[1]
    Run Keyword If    'True'=='${recurring_payments}'    Log To Console    "Please use my card details for recurring payments is selected by default"    ELSE    Fail    "Please use my card details for recurring payments is not selected by default"
    
    ${more_childrens}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '0'=='${more_childrens}'    Log To Console    "Sponsor More Children is 0 by default "    ELSE    Fail    "Sponsor More Children is not 0 by default"
   
    #select child amount
    ${camp_amt}=    Get Text    xpath=(//label[contains(text(),'3 Month')])[1]
    ${camp_amt}=    Convert to price    ${camp_amt}    
    Click Element    xpath=(//label[contains(text(),'3 Month')])[1]
    #Click Element    id=ChkForSI    
    Add to cart text change    
    #sponsor child count
    FOR    ${element}    IN RANGE    1    5
        Click Element    xpath=(//div[@id='sip_increase'])[1]    
    END    
    ${child_count}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '4'!='${child_count}'    Fail    Sponsored Child count doesnt macth
    
    #Add to cart buttton
    Click Element    xpath=(//button[contains(@class,'si_modal_btn')])[1]
    #Click Element    xpath=//div[@class='kl_flood_sub_or_sec']/input
    
    SI login
    Sleep    5s    
    SI payment gateway check

To check whether filters work properly in magazine page
    [Tags]    Media
    
    Jenkins browser launch
    Navigation banner close    
    Event Page menu check    Publication

    Mouse Over    xpath=//h4[text()='Magazines']  
    Click Element    xpath=//h4[text()='Magazines']/parent::div//a[text()='View more']    
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//h1[text()='Jeevan Sparsh']        
    Run Keyword If    'True'!='${status}'    Fail    Jeevan Sparsh page doesnt load    ELSE    Log To Console    Jeevan Sparsh page loaded

    Select From List By Label    id=edit-tid-1    Issue 41
    Click Element    id=edit-submit-jeevan-sparsh-newsletter
    
    @{issues41}=    Get WebElements    xpath=//div[contains(@class,'Txt_ctnr')]/h3
    FOR    ${element}    IN    @{issues41}
        ${text}=    Get Text    ${element}
        Log To Console    issue 41: ${text}
    END

Donate single campaign and to verify in make payment page
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign     Hungerfree 
    Sleep    10s
    Click Element    xpath=.//div[@class='add-to-cart-section']
    ${amount_default}=    Get Element Attribute    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    value
    Run Keyword If    '${amount_default}'!='1000'    Fail    Default amount 1000Rs was not present in hungerfree campaign page
    Click Element    class=closebtn    
    ${camp_name}    ${Camp_val}    one time campaign - Hunger Free campaign       
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}    
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Campaign')] 
    Why do you want to quit - PopUp
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Campaign')]
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='user_campheading']/a[contains(text(),'${camp_name}')]    
    Run Keyword If    'True'!='${status}'    Fail    Campaign not found    ELSE    Log    Campaign found in MyCampaign page        
    Click Element    xpath=//li[@class='post_lgn']/a  
    Wait Until Element Is Visible    xpath=//li[@id='oneTime-shwhde']    60s  
    Click Element    xpath=//li[@id='oneTime-shwhde']
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='cld-nme']/p[contains(text(),'${camp_name}')]
    Run Keyword If    '${status}'!='True'    Fail    Selected campaign was not added in mydonation bucket
    
sponsor single child and to verify in make payment page - My child
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Banner Alert    
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Cart campaign check and delete
    Mouse Over    xpath=//div[@class='main-menu-inner']//li/span[contains(.,'Child Sponsorship')]
    Click Element    xpath=//div[@class='main-menu-inner']//a[contains(.,'Sponsor a Child')]
    
    ${by_specific}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[contains(@class,'checked')]   
    Run Keyword If    '${by_specific}'=='True'    Log To Console    "By specific is selected by default"    ELSE    Fail    "By specific was not selected by default"
    
    ${most_needed}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='gbl_tabbed_menu']//li[contains(@class,'most-needed active')]
    Run Keyword If    '${most_needed}'=='True'    Log To Console    "Most Needed is selected by default"    ELSE    Fail    "Most Needed was not selected by default"
    
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]    
    ${child_details}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]/p
    ${child_location}=    Get Text    xpath=(//div[@class='bySpecLocation'])[1]/p    
    
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    
    ${child_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='overall_banner_pledge'][1]/div[2]/h2[contains(text(),'${Child_name}')]
    Run Keyword If    'True'=='${child_status}'    Log To Console    "Child found in popup menus"    ELSE    Fail    "Child is mismatching in popup menu"
    
    ${recurring_payments}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=(//input[@id='ChkForSI'])[1]
    Run Keyword If    'True'=='${recurring_payments}'    Log To Console    "Please use my card details for recurring payments is selected by default"    ELSE    Fail    "Please use my card details for recurring payments is not selected by default"
    
    ${more_childrens}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '0'=='${more_childrens}'    Log To Console    "Sponsor More Children is 0 by default "    ELSE    Fail    "Sponsor More Children is not 0 by default"
   
    #select child amount
    ${camp_amt}=    Get Text    xpath=(//label[contains(text(),'1 Month')])[1]
    ${Camp_amt}=    Get Substring    ${camp_amt}    9    16
    ${camp_amt}=    Convert to price    ${camp_amt}    
    Click Element    xpath=(//label[contains(text(),'1 Month')])[1]
    Click Element    id=ChkForSI    
    Add to cart text change            
    
    #Add to cart buttton
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']/input
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    
    Click Element    xpath=//div[@class='cart-buttons']/a[2]    
    
    ${cart_quanity}=    check in view cart page - Checkout flow    ${Child_name}    ${camp_amt}    
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${Child_name}    ${camp_amt}    ${cart_quanity}
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]
    Why do you want to quit - PopUp    
    Sleep    10s    
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='child_title' and contains(text(),'${Child_name}')]        
    Run Keyword If    'True'!='${status}'    Fail    Child was not visible in Mychild page
    
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Campaign')]
    Wait Until Element Is Visible    xpath=//li[@id='campsec-shwhde']    60s   
    Click Element    xpath=//li[@id='campsec-shwhde']    
    ${Campaign_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='cld-nme']/p[contains(text(),'${Child_name}')]        
    Run Keyword If    '${Campaign_visible}'!='True'    Fail    Campaign is not showing in my campaign page    ELSE    Log To Console    Campaign is showing in my campaign page
   


To sponsor single campaign and to verify in make payment page
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete            
    Mouser hover ways to give campaign    Save Malnourished Children
    Sleep    5s
    
    Click Element    xpath=.//div[@class='item-image']//img        

    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div   
    ${label_val}=    Get Text    xpath=//label[contains(text(),'3 Months')]
    #${label_val}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    ${Camp_amt}=    Get Substring    ${label_val}    9    16
    ${Camp_amt_sorted}=    Remove String Using Regexp    ${Camp_amt}    \\D 
    Log To Console    Final val is: ${camp_amt}
    Sleep    15s
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='price save-malnourished-cart-sec current']/label[contains(text(),'1 Year ')]        
    Run Keyword If    '${status}'!='True'    Fail    Rs 7200 was not selected by default    ELSE    Log    Rs 7200 was selected by default

    Wait Until Element Is Visible    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    15s    
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Sleep    10s    
    Click Element    id=ChkForSI
    
    Add to cart text change
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//a[@class='view_cart']

    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification - dynamic    ${camp_name}    ${Camp_amt_sorted}    ${cart_quanity}
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Campaign')]
    Why do you want to quit - PopUp    
    Sleep    10s    
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Campaign')]
    Wait Until Element Is Visible    xpath=//li[@id='campsec-shwhde']    60s   
    Click Element    xpath=//li[@id='campsec-shwhde']    
    ${Campaign_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='cld-nme']/p[contains(text(),'${camp_name}')]        
    Run Keyword If    '${Campaign_visible}'!='True'    Fail    Campaign is not showing in my campaign page    ELSE    Log To Console    Campaign is showing in my campaign page


To verify download tax receipt should not reflect in offline success page
    
    [Tags]    Payment Acknowlodgement
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Sleep   20s
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children    
    ${camp_name}    ${camp_val}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${Camp_val}       
    View cart proceed button    
    Sleep    10s    
    Click Element    xpath=//input[@id='edit-payment-information-payment-method-offline-payment']    
    Scroll Element Into View    class=upihead
    #Click Element    xpath=//label[@class='off-container' and contains(text(),'UPI')]/span
    Sleep    10s 
    Click Element    id=off-edit-actions-next
    CCavenue payment - cart verification    ${camp_name}    ${camp_val}    ${cart_quanity}    
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//a[@id='downloadReceipt']        
    Run Keyword If    '${status}'!='True'    Fail    Receipt available for offline payment

To verify child timeline
    [Tags]    MyChild Page
        
    Jenkins browser launch
    Click Login
    Direct login
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]    
    Click Element    xpath=(//div[@class='child_title'])[1]
    Click Element    xpath=(//div[@class='child_name heartbeat'])[1]    
    Child Menus Verify   
    Sleep    5s    
    ${timeline}=    Get Element Attribute    xpath=//ul[@class='tab-mnu']/li[1]    class
    Run Keyword If    '${timeline}'!='active'    Fail    Cannot able to view timeline

To verify banner should appear for Donator at the month of March 1st and April 31st
    [Tags]    Tax Receipt Banner    
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Sleep    10s    
    ${day}=    Get Current Date    result_format=%Y-%m-%d    
    ${date}=    Convert Date    ${day}    datetime  
    Log To Console    Current month is: ${date.month}
    Run Keyword If    ${date.month}==3 or ${date.month}==4    Banner text check should be visible    80G receipt    ELSE    Log To Console    Current month is not March or April 
    

To Verify Tax receipt banner is not appear for the Donator before 28th Feburary
    [Tags]    Tax Receipt Banner    
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Sleep    10s    
    ${day}=    Get Current Date    result_format=%Y-%m-%d    
    ${date}=    Convert Date    ${day}    datetime   
    Log To Console    Current month is: ${date.month}          
    Run Keyword If    ${date.month}!=3 or ${date.month}!=4    Banner text check should not visible    80G receipt    ELSE    Log To Console    Currrent month is March or April banner should be present

To Verify Donor birthday banner should appear at the date before and after 15 days
    [Tags]    Donor birthday banner functionallity
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouse Over    xpath=//li[@class='welcomesponsor']
    Click Link    xpath=//a[@href="/user"]
    
    ${today_date}=    today date complete        
    ${dob_coverted}=    get DOB from my profile    
    ${days_have}=    no of days have calculation    ${dob_coverted}    ${today_date}    
    Run Keyword If    ${days_have}<=15    Banner check birthday    SPREAD THE JOY    ELSE    Log To Console    Donor birthday was not today

To Verify Donor Birthday banner should not appear when donor does not have birthday
    [Tags]    Donor birthday banner functionallity
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Mouse Over    xpath=//li[@class='welcomesponsor']
    Click Link    xpath=//a[@href="/user"]
    
    ${today_date}=    today date complete
        
    ${dob_coverted}=    get DOB from my profile
    
    ${days_have}=    no of days have calculation    ${dob_coverted}    ${today_date}
    
    Run Keyword If    ${days_have}>15    Banner check birthday - should not visible    SPREAD THE JOY    ELSE    Log To Console    Today is donor birthday 

To Verify First name Enter a valid String of Character with minimum length of 2
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Register    
    
    ${title}=    Get Title                        
    Should Contain    ${title}    Create new account       
    
    
    Input Text    xpath=//input[@id='edit-field-first-name-0-value']    tes    
    Sleep    3s
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//strong[@id='edit-field-first-name-0-value-error']        
    Run Keyword If    '${status}'!='True'    Fail    Minimun character number error was not visible
    
    Clear Element Text    xpath=//input[@id='edit-field-first-name-0-value']
    Input Text    xpath=//input[@id='edit-field-first-name-0-value']    a b        
    Sleep    3s            
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//strong[@id='edit-field-first-name-0-value-error']        
    Run Keyword If    '${status}'!='True'    Fail    Minimun character number error was not visible
    
    Clear Element Text    xpath=//input[@id='edit-field-first-name-0-value']
    Input Text    xpath=//input[@id='edit-field-first-name-0-value']    ab            
    Press Keys    //label[@for='edit-field-first-name-0-value']    TAB    
    Sleep    3s            
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//strong[@id='edit-field-first-name-0-value-error']        
    Run Keyword If    '${status}'!='True'    Fail    Minimun character number error was not visible
    
    Clear Element Text    xpath=//input[@id='edit-field-first-name-0-value']        
    ${FirstNameMax}=    Generate Random String    length=54
    Input Text    xpath=//input[@id='edit-field-first-name-0-value']    ${FirstNameMax}
    Sleep    3s                
    ${firstname}=    Get Element Attribute    xpath=//input[@id='edit-field-first-name-0-value']    value
    ${length}=    Get Length    ${firstname}
    Run Keyword If    ${length}>30    Fail    Minimun character number error was not visible

To Verify Last name Enter a valid String of Character with minimum length of 2
    [Tags]    Registration Page
    
    Jenkins browser launch    
    Click Register  
       
    ${title}=    Get Title                        
    Should Contain    ${title}    Create new account                      
        
    Input Text    xpath=//input[@id='edit-field-last-name-0-value']    te    
    Sleep    3s
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//input[@id='edit-field-last-name-0-value']/parent::div//strong        
    Run Keyword If    '${status}'!='True'    Fail    Minimun character number error was not visible
    
    Clear Element Text    xpath=//input[@id='edit-field-last-name-0-value']
    Input Text    xpath=//input[@id='edit-field-last-name-0-value']    a b
    Sleep    3s            
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//input[@id='edit-field-last-name-0-value']/parent::div//strong        
    Run Keyword If    '${status}'!='True'    Fail    Minimun character number error was not visible
    
    Clear Element Text    xpath=//input[@id='edit-field-last-name-0-value']
    Input Text    xpath=//input[@id='edit-field-last-name-0-value']    a
    Press Keys    //label[@for='edit-field-last-name-0-value']    TAB    
    Sleep    3s            
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//input[@id='edit-field-last-name-0-value']/parent::div//strong       
    Run Keyword If    '${status}'!='True'    Fail    Minimun character number error was not visible
    
    Clear Element Text    xpath=//input[@id='edit-field-last-name-0-value']
    Sleep    3s
    ${errorMsg}=    Get Text    xpath=//input[@id='edit-field-last-name-0-value']/parent::div//strong
    Run Keyword If    '${errorMsg}'!='${MandatoryField}'    Fail    This field is mandatory error doesnt appear

    ${LastNameMax}=    Generate Random String    length=54
    Input Text    xpath=//input[@id='edit-field-first-name-0-value']    ${LastNameMax}    
    Sleep    3s        
    ${lastname}=    Get Element Attribute    xpath=//input[@id='edit-field-last-name-0-value']    value
    ${length}=    Get Length    ${lastname}
    Run Keyword If    ${length}>30    Fail    Maximum character exceeded in firstname field

To verify Tax Receipt banner is not appear for Register user after May 1st
    [Tags]    Tax Receipt Banner    
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    Sleep    10s    
    ${day}=    Get Current Date    result_format=%Y-%m-%d    
    ${date}=    Convert Date    ${day}    datetime   
    Log To Console    Current month is: ${date.month}          
    Run Keyword If    ${date.month}!=3 or ${date.month}!=4    Banner text check should not visible    80G receipt    ELSE    Log To Console    Currrent month is March or April banner should be present

To Verify Reconfirm password Field User Should enter Password Details with min
    [Tags]    Registration Page
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]     
    Sleep    10s        
    Password matching check    
    Password doesnt matching check
    #confirm password
    Clear Element Text    id=edit-pass-pass1
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    ${pass1}    
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-pass-pass1-error        
    Run Keyword If    '${status}'=='True'    Log To Console    Page throughs error message for password minimum length    ELSE    Fail    Page doesnt throughs error message for password minimum length          
    
    Clear Element Text    id=edit-pass-pass2
    Click Element    //label[@for='edit-pass-pass2']    
    Input Text    id=edit-pass-pass2    ${pass1}    
    Sleep    5s
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-pass-pass2-error        
    Run Keyword If    '${status}'=='True'    Log To Console    Page throughs error message for password minimum length    ELSE    Fail    Page doesnt throughs error message for password minimum length                  

To Verify Address 1 Field minimum and maximum
    [Tags]    Registration Page
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]     
    Sleep    10s
    
    ${address_random_min}=    Generate Random String    length=9
    ${address_random_max}=    Generate Random String    length=65                        
    
    Input Text    xpath=//input[@id='edit-field-registeraddress-0-value']    ${address_random_min}  
    Press Keys    xpath=//input[@id='edit-field-registeraddress-0-value']    TAB
    ${address_min}=    Get Element Attribute    xpath=//input[@id='edit-field-registeraddress-0-value']    value
    ${length}=    Get Length    ${address_min}
    Run Keyword If    ${length}<10    Element Should Be Visible    id=edit-field-registeraddress-0-value-error    ELSE    Fail    Minimum length alert was not visible    
                
    Clear Element Text    xpath=//input[@id='edit-field-registeraddress-0-value']
    Input Text    xpath=//input[@id='edit-field-registeraddress-0-value']    ${address_random_max}
    ${address_max}=    Get Element Attribute    xpath=//input[@id='edit-field-registeraddress-0-value']    value
    ${length}=    Get Length    ${address_max}
    Run Keyword If    ${length}>60    Fail    Maximum character exceeded in firstname field    ELSE    Log To Console    Maximum length is maintained in address field    

To Verify Address 2 Field minimum and maximum
    [Tags]    Registration Page
    
    Jenkins browser launch
    Navigation banner close
    Click Element    xpath=//a[contains(text(),'Register')]     
    Sleep    10s
    
    ${address_random_min}=    Generate Random String    length=9
    ${address_random_max}=    Generate Random String    length=65                        
    
    Input Text    xpath=//input[@id='edit-field-address-2-0-value']    ${address_random_min}  
    Press Keys    xpath=//input[@id='edit-field-address-2-0-value']    TAB
    ${address_min}=    Get Element Attribute    xpath=//input[@id='edit-field-address-2-0-value']    value
    ${length}=    Get Length    ${address_min}
    Run Keyword If    ${length}<10    Element Should Be Visible    id=edit-field-address-2-0-value-error    ELSE    Fail    Minimum length alert was not visible    
                
    Clear Element Text    xpath=//input[@id='edit-field-address-2-0-value']
    Input Text    xpath=//input[@id='edit-field-address-2-0-value']    ${address_random_max}
    ${address_max}=    Get Element Attribute    xpath=//input[@id='edit-field-address-2-0-value']    value
    ${length}=    Get Length    ${address_max}
    Run Keyword If    ${length}>60    Fail    Maximum length is exceeded in address field    ELSE    Log To Console    Maximum length is maintained in address field    

To verify How do you Know about World Vision select from the options provided in
    [Tags]    Registration Page
    
    Jenkins browser launch
    Navigation banner close    
    Click Element    xpath=//a[contains(text(),'Register')]    
    FOR    ${element}    IN    @{how_do_you_know}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-field-how-do-you-know-about-worl 
        Run Keyword If    '${status}'=='True'    Select From List By Label    id=edit-field-how-do-you-know-about-worl    ${element}    ELSE    Fail    "${element} is not in how do you know dropdown"
    END 

To verify payment failure for HDFC payment gateway - For indian passport holder
    [Tags]    Payment Acknowlodgement for Indian Passport Holder          
      
    Jenkins browser launch
    Click Login
    Direct login    
    Click Cart
    Banner Alert
    Cart campaign check and delete            
    #Select Hunger free campaign
    Mouse hover ways to give after login    Educate Children
    Sleep    10s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button    
    Sleep    10s    
    ${checkout_payment_list}=    Get Element Count    xpath=//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    4!=${checkout_payment_list}    Fail    "Checkout flow Other passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${PGname_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${PGname_status}'    Fail    'Payment Gateway ${bank_txt} for Checkout flow other passport holder is mismatch'    ELSE    Log    Payment gateway lists are matching    
    END
    ${camp_amt}=    Convert to price    ${camp_amt}
    HDFC payment failure flow    
    CCavenue payment - failure cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}

To verify payment failure for Axis bank payment gateway - For indian passport holder
    [Tags]    Payment Acknowlodgement for Indian Passport Holder          
      
    Jenkins browser launch
    Click Login
    Direct login    
    Click Cart
    Banner Alert
    Cart campaign check and delete            
    #Select Hunger free campaign
    Mouse hover ways to give after login    Educate Children    
    Sleep    10s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button    
    Indian Checkout Flow Payment Gateway Verify
    ${camp_amt}=    Convert to price    ${camp_amt}
    Axis payment failure flow    
    CCavenue payment - failure cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}

To verify cart data is maintaining for existing user
    [Tags]    Cart functionality
    
    Jenkins browser launch
    Banner Alert        
    Click Login
    Direct login        
    Click Cart    
    Cart campaign check and delete
    Sleep    10s       
    Mouser hover ways to give campaign    Educate Children
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    Sleep    10s        
    Logout
    Click Element    class=close-survey        
    ${title}=    Get Title    
    Run Keyword If    '${title}'=='Log in | World vision'    Log    User logged out and redirected to login page    ELSE    Fail    User does not logged out    
    Click Login
    Direct login
    Click Cart             
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}

To verify payment failure for HDFC payment gateway - For other passport holder
    [Tags]    Payment Acknowledgment for Other Passport Holder

    Jenkins browser launch
    Click Login
    Direct login - Other passport user    
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouse hover ways to give after login    Educate Children
    ${camp_name}    ${camp_amt}    Other Passport Flow
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    ${camp_amt_int}=    Convert to price    ${camp_amt}
    Sleep    15s    
    Element Status Check    xpath=//span[contains(text(),'POWERED BY HDFC BANK')]    HDFC payment gateway is visible    HDFC payment gateway is not visible        
    Element Status Check    class=netbanking    CREDIT CARD is visible    CREDIT CARD is not visible
    HDFC payment failure flow    
    CCavenue payment - failure cart verification    ${camp_name}    ${camp_amt_int}    ${cart_quanity}

To verify payment using SI with existing onetime donation payment in cart
    [Tags]    Multiple payment functionality
    
    Jenkins browser launch
    Navigation banner close
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    ${camp_name}    ${Camp_val}    one time campaign
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}        
    Mouse hover ways to give after login    Educate Children
    SI flow campaign
    SI payment gateway check    
    
    Click Element    xpath=//div[contains(@class,'net-banking-payment other-bank-opt debit')]    
    Click Element    xpath=//button[text()='Proceed']

To verify login through valid email ID with invalid OTP
    [Tags]    LOGIN
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    
    Click Element    id=edit-name    
    Input Text    id=edit-name    wv@wv.com 
    
    Click Element    id=ToGetOTP    
    
    Wait Until Element Is Visible    class=orngClr    60s
    
    ${status}=    Run Keyword And Return Status    Element Should Contain    class=orngClr    OTP has been sent to your Mobile/Email
    Run Keyword If    'True'=='${status}'    Log    OTP alert message displayed    ELSE    Fail    OTP alert message was not displayed

    Click Element    id=edit-pass
    Input Text    id=edit-pass    123456    

    Click Element    xpath=(//div[@class='login-form__submit']/button)[1] 
    
    Wait Until Element Is Visible    id=edit-pass-error    60s       
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-pass-error
    Run Keyword If    'True'=='${status}'    Log    Login failure alert message displayed    ELSE    Fail    Login failure alert message was not displayed

    
To verify login through valid mobile number with invalid OTP
    [Tags]    LOGIN    
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    
    Click Element    id=edit-name    
    Input Text    id=edit-name    9999999995
    
    Click Element    id=ToGetOTP    
    
    Wait Until Element Is Visible    class=orngClr    60s
    
    ${status}=    Run Keyword And Return Status    Element Should Contain    class=orngClr    OTP has been sent to your Mobile/Email
    Run Keyword If    'True'=='${status}'    Log    OTP alert message displayed    ELSE    Fail    OTP alert message was not displayed

    Click Element    id=edit-pass
    Input Text    id=edit-pass    123456    

    Click Element    xpath=(//div[@class='login-form__submit']/button)[1] 
    
    Wait Until Element Is Visible    id=edit-pass-error    60s       
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=edit-pass-error
    Run Keyword If    'True'=='${status}'    Log    Login failure alert message displayed    ELSE    Fail    Login failure alert message was not displayed

To verify amount addition in campaign based on transaction
    [Tags]    Make payment page functionality
    
    Jenkins browser launch
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    
    #Donating 1000Rs for Hungerfree campaign
    Mouse hover ways to give after login    Hungerfree
    ${camp_name}    ${Camp_val}    one time campaign - Hunger Free campaign - Multiple payment    ${amount}       
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button    
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}
    Banner Alert
    Click mainmenu    My Campaign 
    Why do you want to leave - PopUp
    Click mainmenu    My Campaign 
    Mycampaign Check    ${camp_name}    
    Click my next payment
    ${Camp_val}=    Convert to price    ${Camp_val}
    My Next Payment cart check    ${camp_name}    ${Camp_val}
       
    #Donating 4000Rs for Hungerfree campaign
    Logout
    Direct login
    ${camp_name2}    ${Camp_val2}    one time campaign - Hunger Free campaign - Multiple payment    ${HungerFree_amt}       
    ${cart_quanity2}    check in view cart page - One time donation flow    ${camp_name2}    ${Camp_val2}
    View cart proceed button    
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name2}    ${Camp_val2}    ${cart_quanity2}
    Banner Alert
    Click mainmenu    My Campaign
    Why do you want to leave - PopUp
    Click mainmenu    My Campaign  
    Mycampaign Check    ${camp_name2}    
    Click my next payment
    ${Camp_val2}=    Convert to price    ${Camp_val2}
    ${total_amount}=    Evaluate        ${Camp_val}+${Camp_val2}
    My Next Payment cart check    ${camp_name2}    ${total_amount} 

Bubble Scenario-Online Payment : Sponsor Payment Mode - Delinquent + Current + Advance
    [Tags]    Make payment page functionality
    
    Jenkins browser launch       
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    
    Click my next payment
    Click Element    xpath=//li[@id='campsec-shwhde']/a 
    
    ${campaign_available}=    Get Element Count    xpath=//div[contains(@class,'itm-sltn-add')]
    ${campaign_total}=    Get Text    xpath=//div[@class='cost-sumry']//span[2]
    
    Click Element    class=pymnt-smt-sec
    
    ${cart_total_amt}=    Get Text    xpath=//p[@class='cld-amount-pyble']//span[2]    
    
    Run Keyword If    '${cart_total_amt}'!='${campaign_total}'    Fail    Cart amount doesnt match
    Click Button    id=MP_add_to_cart_btn
    
    Click Element    class=view_cart
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//span[@class='order-total-line-value and contains(text(),'${cart_total_amt}'])[2]        
    Run Keyword If    '${status}'!='True'    Fail    cart amount doesnt macth
    CCavenue payment success flow
    
    Banner Alert
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='payment-paid']//span[contains(text(),'${cart_total_amt}')]        
    Run Keyword If    '${status}'!='True'    Fail    cart amount doesnt macth

Bubble Scenario-Offline Payment : Sponsor Payment Mode - Delinquent + Current + Advance
    [Tags]    Make payment page functionality
    
    Jenkins browser launch       
    Click Login
    Direct login
    Click Cart
    Banner Alert
    Cart campaign check and delete
    
    Click my next payment
    Click Element    xpath=//li[@id='campsec-shwhde']/a 
    
    ${camp_name}=    Get Text    xpath=(//div[@class='cld-nme-dtls'])[1]/div[1]/p
    Click Element    xpath=(//div[@class='cld-nme-dtls'])[1]
    
    ${camp_amt}=    Get Text    xpath=(//span[@class='childCart_total_amount'])[1]                
    
    Click Element    class=pymnt-smt-sec
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[@class='cld-amount-pyble']//span[2][contains(text(),'${camp_amt}')]            
    Run Keyword If    '${status}'!='True'    Fail    Cart amount doesnt match
    
    Click Button    id=MP_add_to_cart_btn
    
    Click Element    class=view_cart
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//span[@class='order-total-line-value' and contains(text(),'${camp_name}')])[2]        
    Run Keyword If    '${status}'!='True'    Fail    cart amount doesnt macth        
    
    Click Element    id=edit-checkout    

    Click Element    xpath=//input[@id='edit-payment-information-payment-method-offline-payment']    
    Scroll Element Into View    class=upihead
    Sleep    10        
    Click Element    xpath=//label[@class='off-container' and contains(text(),'UPI')]/span
    Sleep    10s 
    Click Element    id=off-edit-actions-next
    
    Banner Alert
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='payment-paid']//span[contains(text(),'${camp_amt}')]        
    Run Keyword If    '${status}'!='True'    Fail    cart amount doesnt macth

To verify other passport holder SI payment is disabled - PostLogin
    [Tags]    Payment gateway Based on Nationality
    
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login - Other passport user
    Click Element    xpath=.//a[contains(.,'My Gifts')]    
    Banner Alert
    Cart campaign check and delete
    View Myprofile    
    Nationality Check
    Mouse hover ways to give after login    Educate Children
    I Pledge to Support Click
    SI Payment disable check

To verify other passport holder SI payment is disabled - PreLogin
    [Tags]    Payment gateway Based on Nationality
    
    Jenkins browser launch  
    Gift Cart Click      
    Cart campaign check and delete           
    Mouser hover ways to give campaign    Educate Children        
    #SI Payment disable check
    SI flow campaign     
    SI login - Other Passport
    SI Other Passport Disabled Alert    
    Page Title Check and confirm    Educate Children
    
    Gift Cart Click      
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children  
    ${camp_name}    ${camp_amt}    Other Passport Flow
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    ${camp_amt}=    Convert to price    ${camp_amt}
    Hdfc bank payment gateway check

To verify other passport holder SI payment is disabled in child rotator – PreLogin
    [Tags]    Other passport SI payment verifiaction
    
    Jenkins browser launch    
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details
    Log To Console    Child name:${child_name} and child amount:${sel_child_amt} and also child img src:${sel_child_imgsrc}
    Rotator Allow Auto Debit status check
    Rotator Proceed To Autopay
    SI login - Other Passport    
    SI Other Passport Disabled Alert    
    Page Title Check and confirm    My World

To verify share the joy alert functionality
    [Tags]    Share the Joy functionality
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment flow
    Share the Joy Alert Capture

To verify Why do you want to Leave Alert in Payment Page    
    [Tags]    Payment Page Quit Alert
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    ${PG_Title}=    Get Title
    Should Contain    ${PG_Title}    Order information    
    My Next Payment
    Why do you want to leave alert button check

To verify share the joy alert email section funtionality 
    [Tags]    Share the Joy functionality
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment flow
    Share the Joy Alert Capture
    Share The Joy Email Section  

To verify share the joy alert Copy URL section funtionality 
    [Tags]    Share the Joy functionality
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment flow
    Share the Joy Alert Capture
    Share The Joy Copy URL Section

To verify cart page People have Also Donated for Suggession - campaign below 3 products 
    [Tags]    Cart functionality
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}        
    
    ${CartCount}=    Get Element Count    class=views-field views-field-product-id
    ${CartCount}=    Evaluate    ${CartCount}-1    
    ${CartCount}=    Convert To Integer    ${CartCount}    
    
    Run Keyword If    ${CartCount}<3    People have Also Donated for Content Check    ELSE    Log    Currently there are more than 2 Campaign or child to sponsor

To Verify User should submit form without entering Message
    [Tags]    Form in contact us page
    
    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'About Us')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Contact Us')] 
    Sleep    15s    
    Scroll Element Into View    id=edit-actions-submit                
    Input Text    id=edit-name-    testname
    Input Text    id=edit-email-    test@test.com
    Input Text    id=edit-contact-    9999999995    
    Click Element    id=edit-query-type-styled
    Click Element    xpath=//a[text()='Sponsorship']           
    Click Element    id=edit-actions-submit
    Sleep    5s
    ${alert}=    Run Keyword And Return Status    Element Should Contain    id=edit-message-error    Message is required
    Run Keyword If    'True'!='${alert}'    Fail    Message field alert was not displayed    ELSE    Log    Message field alert displayed    

To Verify User should submit the form without Query Type
    [Tags]    Form in contact us page
    
    Jenkins browser launch
    Navigation banner close
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'About Us')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Contact Us')] 
    Sleep    15s    
    Scroll Element Into View    id=edit-actions-submit                
    Input Text    id=edit-name-    testname
    Input Text    id=edit-email-    test@test.com
    Input Text    id=edit-contact-    9999999995    
    Input Text    id=edit-message    test message input
    Click Element    id=edit-actions-submit
    Sleep    5s
    ${alert}=    Run Keyword And Return Status    Element Should Contain    id=edit-query-type-error    Query Type is required
    Run Keyword If    'True'!='${alert}'    Fail    Query Type field alert was not displayed    ELSE    Log    Query Type field alert displayed

To Verify User should submit the form without Query Type - End Child sexual abuse Page    
    [Tags]    Form in End Child sexual abuse Page
    
    Jenkins browser launch
    Navigation banner close
    Mouser hover ways to give campaign    End Child Sexual Abuse 
    Sleep    15s    
    Scroll Element Into View    id=edit-actions-submit                
    Input Text    id=edit-name-    testname
    Input Text    id=edit-email-    test@test.com
    Input Text    id=edit-contact-    9999999995    
    Input Text    id=edit-message    test message input
    Click Element    id=edit-actions-submit
    Sleep    5s
    ${alert}=    Run Keyword And Return Status    Element Should Contain    id=edit-query-type-error    Query Type is required
    Run Keyword If    'True'!='${alert}'    Fail    Query Type field alert was not displayed    ELSE    Log    Query Type field alert displayed
    
To Verify User should submit form without entering Message - End Child sexual abuse Page
    [Tags]    Form in End Child sexual abuse Page
    
    Jenkins browser launch
    Navigation banner close
    Mouser hover ways to give campaign    End Child Sexual Abuse 
    Sleep    15s    
    Scroll Element Into View    id=edit-actions-submit                
    Input Text    id=edit-name-    testname
    Input Text    id=edit-email-    test@test.com
    Input Text    id=edit-contact-    9999999995    
    Click Element    id=edit-query-type-styled
    Click Element    xpath=//a[text()='Sponsorship']           
    Click Element    id=edit-actions-submit
    Sleep    5s
    ${alert}=    Run Keyword And Return Status    Element Should Contain    id=edit-message-error    Message is required
    Run Keyword If    'True'!='${alert}'    Fail    Message field alert was not displayed    ELSE    Log    Message field alert displayed
    
To verify share the joy alert Social Media section funtionality 
    [Tags]    Share the Joy functionality
    
    Jenkins browser launch
    Gift Cart Click
    Banner Alert
    Cart campaign check and delete
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment flow
    Share the Joy Alert Capture
    Share The Joy Social Media Section    

To verify interruption While registering new user and cancel continue where you left
    [Tags]    Registration Page
    
    Jenkins browser launch - Without Incognito
    Click Register
    Select Title    Mr.
    Enter First Name    TestNameF
    Enter Last Name    TestNameL
    Enter Email ID    test@test.test
    Enter Phone Number    8888888880
    Enter Password    password
    Enter Confirm Password    password
    Enter Address Field I    Test address 1    
    Scroll Element Into View    class=singUpRegister
    Click Create My Account    
    Sleep    5s            
    Close Browser
    Sleep    5s       
    Jenkins browser launch - Without Incognito
    Wait Until Element Is Visible    xpath=//h4[contains(text(),'continue where you left')]    30s
    Click Element    xpath=//button[contains(@class,'alredy-no')]  

Verify user should submit the form without DOB 
    [Tags]      Hunger Free Campaign
    
    Jenkins browser launch
    Click Login
    Direct login
    Mouse hover ways to give after login    Hungerfree
    Scroll Element Into View    id=edit-actions-submit
    
    Input Text    id=edit-name    Test Name  
    Select From List By Value    id=edit-state    Chhattisgarh
    Input Text    id=edit-email    test@test.com    
    Input Text    id=edit-mobile-number    9999999999
    
    Click Element    id=edit-actions-submit
    Click Element    class=head_first    
    
    Sleep    5s    

    ${status}=    Run Keyword And Return Status    Element Should Contain    id=edit-date-of-birth-error    Date of Birth* is required.
    Run Keyword If    '${status}'!='True'    Fail    Alert message for DOB is not displayed    ELSE    Log    Alert message for DOB is displayed

To verify Home page Properly working
    [Tags]    HomePage
    
    Jenkins browser launch
    ${element}=    Get Element Attribute    xpath=(//a[@class='site-branding-logo'])[1]/img    src
    ${Logo}=    Remove String    ${element}    https://uat.worldvision.in/
    Identify Status Code    ${Logo}
    Home Page Banner Image
    
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    id=myCarousel
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    
    ${element}=    Get Element Attribute    xpath=(//div[@class='child_sponsor_image'])[1]/img    src
    ${Logo}=    Remove String    ${element}    https://uat.worldvision.in/
    Identify Status Code    ${Logo}

To Sponsor a child by SI payment flow from by-specific page
    [Tags]    To Sponsor a Child
    
    Jenkins browser launch
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child
    ${page_title}=    Get Title
    Should Contain    ${page_title}    By Specifics
    ${ChildAge}    ${day}    ${month}    ${year}    ${Location}    ${gender}    Get Child Details BySpecific Page
    BySpecific location click    ${Location}
    Click Age Filter    ${ChildAge}
    Click Gender in BySpecific Page    ${gender}
    Click Month Filter in BySpecific Page    ${month}
    Select Date in BySpecific Page    ${day}
    Click ResetAll BySpecific page
    Click Around You BySpecific page
    Click By Name BySpecific page
    Click MostNeed BySpecific page
    Scroll Element Into View    xpath=//span[text()='Gender']
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]      
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    #Scroll Element Into View    xpath=//h1[text()='Choose a Child to Sponsor']
    Child Name Verify BySpecific page    ${Child_name}
    9600 Amount Button Verify BySpecific page
    SI Checkbox verify BySpecific page
    Child Quantity verify BySpecific page
    Proceed to Pay Button
    SI login
    Sleep    10s 
    SI payment gateway check

To verify share the page to social media
    [Tags]    Social Media Share functionality
    
    Jenkins browser launch    
    Click Element    xpath=//div[@class='scl-lnks-storie_block_share_block']    
    @{windows}=    Get Window Handles    
    ${SocialMediaCount}=    Get Element Count    xpath=//a[contains(@class,'share')]
    FOR    ${count}    IN RANGE    0    ${SocialMediaCount}
        Element Should Be Visible    xpath=//a[contains(@class,'${social_medias}[${count}]')]    30s
        Click Element    xpath=//a[contains(@class,'${social_medias}[${count}]')]
        Sleep    5s
    END
    @{windows}=    Get Window Handles
    FOR    ${element}    IN RANGE    1    5
        Switch Window    ${windows}[${element}]
        ${url}=    Get Location
        Log    ${url} 
        Should Contain    ${url}    home
        Close Window    
    END
    
Stories of change and events page share
    [Tags]    Social Media Share functionality
    
    Jenkins browser launch    
    Mouse Hover main menu and click submenu    Child Sponsorship    Stories of Change
    Wait Until Element Is Visible    xpath=//div[@class='scl-lnks-storie_block_share_block']    60s
    Click Element    xpath=//div[@class='scl-lnks-storie_block_share_block']    
    @{windows}=    Get Window Handles        
    ${SocialMediaCount}=    Get Element Count    xpath=//div[@class='scl-lnks-media-sharing']//a[contains(@class,'share')]
    FOR    ${count}    IN RANGE    0    ${SocialMediaCount}
        Element Should Be Visible    xpath=//a[contains(@class,'${social_medias}[${count}]')]    30s
        Click Element    xpath=//a[contains(@class,'${social_medias}[${count}]')]
        Sleep    5s
        Switch Window    ${windows}[0]
    END
    @{windows}=    Get Window Handles
    FOR    ${element}    IN RANGE    1    5
        Switch Window    ${windows}[${element}]
        ${url}=    Get Location
        Log    ${url}
        Should Contain    ${url}    stories
        Close Window    
    END
    
    Switch Window    ${windows}[0]
    Mouse Hover main menu and click submenu    Get Involved    Events
    Wait Until Element Is Visible    xpath=//div[@class='scl-lnks-storie_block_share_block']    60s
    Click Element    xpath=//div[@class='scl-lnks-storie_block_share_block']    
    @{windows}=    Get Window Handles    
    ${SocialMediaCount}=    Get Element Count    xpath=//a[contains(@class,'share')]
    FOR    ${count}    IN RANGE    0    ${SocialMediaCount}
        Element Should Be Visible    xpath=//a[contains(@class,'${social_medias}[${count}]')]    30s
        Click Element    xpath=//a[contains(@class,'${social_medias}[${count}]')]
        Sleep    5s
        Switch Window    ${windows}[0]
    END
    @{windows}=    Get Window Handles
    FOR    ${element}    IN RANGE    1    5
        Switch Window    ${windows}[${element}]
        ${url}=    Get Location
        Log    ${url} 
        Should Contain    ${url}    news-events
        Close Window    
    END

To Verify Child banner should display for the Donor if the child does not have a birthday
    [Tags]    Child Birthday Banner Functionality
    
    Jenkins browser launch
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]
    
    ${ChildDOB}=    Get Text    xpath=//div[@class='bySpecName']/p[2]
    ${ChildDOBMonth}=    Get Substring    ${ChildDOB}    5    7
    ${DOB_Month}=    Convert To Integer    ${ChildDOBMonth}
    Log    Child Birth Month:${DOB_Month}

    ${today_date}=    today date complete
    ${ThisMonth}=    Set Variable    ${today_date.month}
    
    Log    Child Birth Month: ${ThisMonth}     
    Should Not Be Equal As Integers    ${ThisMonth}    ${DOB_Month}
    
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    
    Child Name Verify BySpecific page    ${Child_name}
    
    ${CampAmt}=    Get Text    xpath=//label[contains(text(),'3 Months')]    
    ${Camp_amt}=    Get Substring    ${CampAmt}    9    16        
    ${Camp_Amount}=    Remove String Using Regexp    ${Camp_amt}    \\D
    
    Click Element    xpath=//label[contains(text(),'3 Months')]    
    Click SI CheckBox
    Add to cart text change
    Click Add To Cart
    Click Proceed To Checkout Button
    ${cart_quanity}    check in view cart page - dynamic    ${childName}    ${Camp_Amount}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${childName}    ${camp_amt}    ${cart_quanity}
    Banner check birthday    Birthday 

To verify Footer rotator functionality
    [Tags]    Footer rotator functionality

    #Local browser launch
    Jenkins browser launch
    Scroll Element Into View    xpath=//strong[text()='World Vision India']
    Child Rotator Status
    Rotator Child Count        
    ${status}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//span[@class='home-price' and contains(text(),'9,600')]/parent::p    class
    Should Contain    ${status}    active            
    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}    Rotator Child Details
    Log    Child name: ${child_name} and child amount: ${sel_child_amt} and also child img src: ${sel_child_imgsrc}            
    Rotator Allow Auto Debit status check
    Rotator Proceed To Autopay Text Check
    Rotator SI checkbox Click    
    Rotator Add to Cart Button Text Check
    Rotator SI checkbox Click
    Rotator Proceed To Autopay
    SI login
    SI payment gateway check

To Verify City details getting auto Populated when Valid Postal code is entered
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Register     
    Element Should Be Visible    class=singUpRegister    60s        
    Scroll Element Into View    class=singUpRegister 
    Input Text    xpath=//input[contains(@id,'edit-field-pin-code')]    600123
    Sleep    5s    
    ${city}=    Get Element Attribute    id=edit-field-city-0-value    value
    Run Keyword If    '${city}'=='${EMPTY}'    Fail    Country Field doesnt auto populate
    Log To Console    City ${city} is auto populated
    
To Verify State details getting auto Populated when Valid Postal code is entered
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Register     
    Element Should Be Visible    class=singUpRegister    60s        
    Scroll Element Into View    class=singUpRegister 
    Input Text    xpath=//input[contains(@id,'edit-field-pin-code')]    600123
    Sleep    5s    
    ${state}=    Get Element Attribute    id=edit-field-regstate-0-value    value
    Run Keyword If    '${state}'=='${EMPTY}'    Fail    Country Field doesnt auto populate
    Log To Console    state ${state} is auto populated

To Verify Country details getting auto Populated when Valid Postal code is entered
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Register     
    Element Should Be Visible    class=singUpRegister    60s        
    Scroll Element Into View    class=singUpRegister 
    Input Text    xpath=//input[contains(@id,'edit-field-pin-code')]    600123
    Sleep    5s    
    ${country}=    Get Element Attribute    id=edit-field-country    value
    Run Keyword If    '${country}'=='${EMPTY}'    Fail    Country Field doesnt auto populate
    Log    Country ${country} is auto populated    

To sponsor 10 child - SI flow
    [Tags]    Sponsor a Child    
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Cart campaign check and delete
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child
    
    ${by_specific}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[contains(@class,'checked')]   
    Run Keyword If    '${by_specific}'=='True'    Log    "By specific is selected by default"    ELSE    Fail    "By specific was not selected by default"
    
    ${most_needed}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='gbl_tabbed_menu']//li[contains(@class,'most-needed active')]
    Run Keyword If    '${most_needed}'=='True'    Log    "Most Needed is selected by default"    ELSE    Fail    "Most Needed was not selected by default"
    
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]    
    ${child_details}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]/p
    ${child_location}=    Get Text    xpath=(//div[@class='bySpecLocation'])[1]/p    
    
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    
    Child Name Verify BySpecific page    ${Child_name}
    9600 Amount Button Verify BySpecific page
    SI Checkbox verify BySpecific page
    Child Quantity default verify BySpecific page    
    #Click 3Month package
    ${camp_amount}=    Get Text    xpath=(//label[contains(text(),'3 Month')])[1]
    ${final_val}=    Get Substring    ${camp_amount}    9    16
    ${camp_amt}=    Convert to price    ${final_val} 
    Click Element    xpath=(//label[contains(text(),'3 Month')])[1]
    #Click Element    id=ChkForSI    
    Add to cart text change    
    No of Child Addition in BySpecific page    10
    Sleep    5s    
    Child Quantity verify BySpecific page    9
    Proceed to Pay Button
    SI login   
    SI payment gateway check
    
    ${price_SI}=    Get Text    id=TotalAmtOfOrder
    ${TotalCartPrice}=    Convert To Integer    ${price_SI}    
    ${TotalPrice}=    Evaluate    ${camp_amt}*10    
    Should Be Equal As Integers    ${TotalCartPrice}    ${TotalPrice}

To verify Allow Auto Debit should be visible for already donated campaign using normal payment
    [Tags]    Payment Gateway Campaign and child
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete           
    Mouser hover ways to give campaign    Educate Children
    Sleep    5s
    ${camp_name}    ${camp_amt}    Checkout flow campaign
    ${cart_quanity}    check in view cart page - Checkout flow    ${camp_name}    ${camp_amt}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${camp_amt}    ${cart_quanity}
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    My Next Payment campaign Check    Educate Children
    Click Element    xpath=//div[@class='cld-nme']//p[contains(text(),'Educate Children')]   
    My Next Payment Proceed Button
    My Next Payment SI Checkbox Enabled Verify

To verify Allow Auto Debit should not be visible for one time donation
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete            
    Mouser hover ways to give campaign     Hungerfree 
    ${camp_name}    ${Camp_val}    one time campaign - Hunger Free campaign       
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Donations
    My Next Payment campaign Check    ${camp_name}
    Click Element    xpath=//div[@class='cld-nme']//p[contains(text(),'${camp_name}')]
    My Next Payment Proceed Button
    My Next Payment SI Checkbox Disabled Verify
    
    
To verify Delinquency condition is not applicable for one time donation 
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Banner Alert
    Cart campaign check and delete            
    Mouser hover ways to give campaign     Hungerfree 
    ${camp_name}    ${Camp_val}    one time campaign - Hunger Free campaign       
    ${cart_quanity}    check in view cart page - One time donation flow    ${camp_name}    ${Camp_val}
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification    ${camp_name}    ${Camp_val}    ${cart_quanity}
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Donations
    My Next Payment campaign Check    ${camp_name}
    Click Element    xpath=//div[@class='cld-nme']//p[contains(text(),'${camp_name}')]
    ${colour}=    Get CSS Attribute Value    locator=//div[@class='cld-nme']//p[contains(text(),'Hunger')]//parent::div/parent::div/parent::div    attribute=border-left
    Log To Console    ${colour}
    Should Contain    ${colour}    ${green}
    Should Not Contain    ${colour}    ${red}

To verify Allow Auto Debit should be visible for already donated child using normal payment
    [Tags]    Make Payment Page

    Jenkins browser launch
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    Cart campaign check and delete
    Mouse Hover main menu and click submenu    Child Sponsorship    Sponsor a Child    
    
    BySpecific Selected By Default
    Most Needed Child Selected By Default
    
    ${Child_name}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]    
    ${child_details}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]/p
    ${child_location}=    Get Text    xpath=(//div[@class='bySpecLocation'])[1]/p
    
    Mouse Over    xpath=(//div[@class='bySpecContHolder'])[1]
    Click Element    xpath=(//input[@value='SPONSOR NOW'])[1]
    
    Child Name Verify BySpecific page    ${Child_name}
    9600 Amount Button Verify BySpecific page
    SI Checkbox verify BySpecific page
    #Child Quantity default verify BySpecific page
    Click SI CheckBox BySpecific Page
    
    ${camp_amount}=    Get Text    xpath=(//label[contains(text(),'3 Month')])[1]
    ${final_val}=    Get Substring    ${camp_amount}    9    16
    ${camp_amt}=    Convert to price    ${final_val}

    Click Element    xpath=(//label[contains(text(),'3 Month')])[1]
    Add to cart text change
    Click Add to Cart BySpecific Page
    Success text in shadow window
    Click Proceed To Checkout Button
    ${cart_quanity}=    check in view cart page - Checkout flow to sponsor a child    ${Child_name}    ${camp_amt}    
    View cart proceed button
    Login
    CCavenue payment success flow
    CCavenue payment - cart verification sponsor a child    ${Child_name}    ${camp_amt}    ${cart_quanity}
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Children
    My Next Payment campaign Check    ${Child_name}
    Click Element    xpath=//div[@class='cld-nme']//p[contains(text(),'${Child_name}')]   
    My Next Payment Proceed Button
    My Next Payment SI Checkbox Enabled Verify

To verify Allow Auto Debit should not be visible for already SI donated campaign 
    [Tags]    Make Payment Page
        
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    Sleep    5s    
    ${after_content}=    Get Pseudo Element CSS Attribute Value    //div[@class='cld-nme']//p[contains(text(),'Educate Children')]/parent::div/parent::div    pseudo_element=':after'   attribute=content
    Should Contain    ${after_content}    "Paid as SI"
    Click Element    xpath=//div[@class='cld-nme']//p[contains(text(),'Educate Children')]
    My Next Payment Proceed Button
    My Next Payment SI Checkbox Disabled Verify

To verify cart function for child donated with SI payment and campaign donated with normal payment  
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']
    
    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${childName}=    Select Child Paid As SI in My Next Payment Page
    ${DonationAmount}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${ChildAmt}=    Convert to price    ${DonationAmount} 

    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    ${campaignName}=    Select campaign Not Paid As SI in My Next Payment Page
    ${TotalCartAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${TotalCart}=    Convert to price    ${TotalCartAmt}
    ${campaignAmt}=    Evaluate    ${TotalCart}-${ChildAmt}
    
    ${int variable}=    Set Variable    ${campaignAmt}
    ${campaignAmtCart}=      Format String     {:,}    ${int_variable}
    
    Footer Cart Amout Hidder click
    Sleep    5s     
    My Next Payment Proceed Button 
    Sleep    5s    
    Shadown Cart Total Amount    ${TotalCartAmt}
    Shadown Window Product verify    ${childName}
    
    ${paymentFrequency}=    Get Payment Frequency    ${campaignName}
    
    My Next Payment Allow To Auto Debit click    
    
    ${Frequency}=    Payment Frequency Convertion    ${paymentFrequency}
    
    Select From List By Label    id=overall_child_due_quantity    ${Frequency}    

    ${BGColour}=    Get CSS Attribute Value    locator=//p[@class='si_title' and contains(text(),'${campaignName}')]/parent::div/parent::div/parent::div    attribute=background-color
    Should Contain    ${BGColour}    ${SICartColour}

    Shadown Window Product verify    ${campaignName}
    Shadown Cart Total Amount    ${campaignAmtCart}   
    
    My Next Payment SI Proceed To Autopay
    Sleep    5s            
    Element Status Check    xpath=//h5[@id='TotalAmtOfOrder']/b[contains(text(),'${campaignAmt}')]    Campaign Amount is visible in Payment gateway    Campaign Amount is not visible in Payment gateway
    

    

To verify redonate for donated child in make payment page
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck   
    Scroll Element Into View    xpath=//a[text()='Donation']
    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${after_content}=    Get Pseudo Element CSS Attribute Value    (//div[@class='cld-nme'])[1]//p[contains(text(),'')]/parent::div/parent::div    pseudo_element=':after'   attribute=content
    Should Not Contain    ${after_content}    Paid as SI
    Click Element    xpath=(//div[@class='cld-nme-dtls'])[1]
    Footer Cart Amout Hidder click
    Sleep    3s    
    My Next Payment Proceed Button

    ${childName}=    Get Text    xpath=(//div[@class='cld-nme-dtls'])[1]/div[1]/p
    ${ChildAmount}=    Get Text    xpath=(//span[@class='childCart_total_amount'])[1]

    #Shadown window
    ${ShadowWindowAmount}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[@class='childCart_total_amount' and contains(text(),'${ChildAmount}')]
    Run Keyword If    '${ShadowWindowAmount}'!='True'    Fail    Child ${ChildAmount} is not visible in shadow window    ELSE    Log    Child ${ChildAmount} is visible in shadow window    
    
    ${ShadowWindowChild}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[@class='si_title' and contains(text(),'${childName}')]    
    Run Keyword If    '${ShadowWindowChild}'!='True'    Fail    Child ${childName} is not visible in shadow window    ELSE    Log    Child ${childName} is visible in shadow window    
    
    Click Element    id=MP_add_to_cart_btn    
    
    Success text in shadow window
    Click Proceed To Checkout Button
    ${cart_quanity}    check in view cart page - Checkout flow    ${childName}    ${ChildAmount}
    View cart proceed button
    CCavenue payment success flow
    CCavenue payment - cart verification    ${childName}    ${ChildAmount}    ${cart_quanity}


To verify Allow Auto Debit should not be visible for already SI donated child 
    [Tags]    Make Payment Page 
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']    
    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${childName}=    Select Child Paid As SI in My Next Payment Page    
    Footer Cart Amout Hidder click
    ${DonationAmount}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${ChildAmt}=    Convert to price    ${DonationAmount}         
    Sleep    5s    
    My Next Payment Proceed Button
    Shadown Window Product verify    ${childName}
    Shadown Cart Total Amount    ${ChildAmt}
    My Next Payment SI Checkbox Disabled Verify


To verify cart function for campaign donated with SI payment and Child donated with normal payment 
    [Tags]    Make Payment Page

    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']
    
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    ${campaignName}=    Select campaign Paid As SI in My Next Payment Page
    ${DonationAmount}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${campaign}=    Convert to price    ${DonationAmount}
    
    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${childName}=    Select Child Paid Not As SI in My Next Payment Page
    ${TotalCartAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${TotalCart}=    Convert to price    ${TotalCartAmt}
    ${ChildAmt}=    Evaluate    ${TotalCart}-${campaign}
    
    ${int variable}=    Set Variable    ${ChildAmt}
    ${ChildAmtCart}=      Format String     {:,}    ${int_variable}

    Footer Cart Amout Hidder click
    Sleep    5s     
    My Next Payment Proceed Button 
    Sleep    5s    
    Shadown Cart Total Amount    ${TotalCartAmt}
    Shadown Window Product verify    ${campaignName}

    ${paymentFrequency}=    Get Payment Frequency    ${childName}    

    My Next Payment Allow To Auto Debit click    
    
    ${Frequency}=    Payment Frequency Convertion    ${paymentFrequency}
    
    Select From List By Label    id=overall_child_due_quantity    ${Frequency} 

    ${BGColour}=    Get CSS Attribute Value    locator=//p[@class='si_title' and contains(text(),'${childName}')]/parent::div/parent::div/parent::div    attribute=background-color
    Should Contain    ${BGColour}    ${SICartColour}

    Shadown Window Product verify    ${childName}
    Shadown Cart Total Amount    ${ChildAmtCart} 

    My Next Payment SI Proceed To Autopay
    Sleep    5s            
    Element Status Check    xpath=//h5[@id='TotalAmtOfOrder']/b[contains(text(),'${ChildAmt}')]    Campaign Amount is visible in Payment gateway    Campaign Amount is not visible in Payment gateway
    

To verify SI cart function for child donated with normal flow and one time donation
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']
    
    My Next Payment MainMenu and SubMenu    Donation    My Donations
    ${OnetimeDonationName}=    Select One Time Donation in My Next Payment Page
    ${DonationAmount}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${OneDonationAmt}=    Convert to price    ${DonationAmount}

    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${childName}=    Select Child Paid Not As SI in My Next Payment Page
    ${TotalCartAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${TotalCart}=    Convert to price    ${TotalCartAmt}
    ${ChildAmt}=    Evaluate    ${TotalCart}-${OneDonationAmt}

    ${int variable}=    Set Variable    ${ChildAmt}
    ${childAmtCart}=      Format String     {:,}    ${int_variable}
    
    Footer Cart Amout Hidder click
    Sleep    5s     
    My Next Payment Proceed Button 
    Sleep    5s    
    Shadown Cart Total Amount    ${TotalCartAmt}
    Shadown Window OTD Product verify    ${OnetimeDonationName}

    ${paymentFrequency}=    Get Payment Frequency    ${childName}    
    My Next Payment Allow To Auto Debit click        
    ${Frequency}=    Payment Frequency Convertion    ${paymentFrequency}
    
    Select From List By Label    id=overall_child_due_quantity    ${Frequency}    

    ${BGColour}=    Get CSS Attribute Value    locator=//p[@class='si_title' and contains(text(),'${childName}')]/parent::div/parent::div/parent::div    attribute=background-color
    Should Contain    ${BGColour}    ${SICartColour}

    Shadown Window Product verify    ${childName}
    Shadown Cart Total Amount    ${childAmtCart}   
    
    My Next Payment SI Proceed To Autopay
    Sleep    5s            
    Element Status Check    xpath=//h5[@id='TotalAmtOfOrder']/b[contains(text(),'${ChildAmt}')]    Campaign Amount is visible in Payment gateway    Campaign Amount is not visible in Payment gateway
    
To verify SI cart function for campaign donated with normal flow and one time donation
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']

    My Next Payment MainMenu and SubMenu    Donation    My Donations
    ${OnetimeDonationName}=    Select One Time Donation in My Next Payment Page
    ${DonationAmount}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${OneDonationAmt}=    Convert to price    ${DonationAmount}
    
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    ${campaignName}=    Select campaign Not Paid As SI in My Next Payment Page
    ${TotalCartAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    ${TotalCart}=    Convert to price    ${TotalCartAmt}
    ${campaignAmt}=    Evaluate    ${TotalCart}-${OneDonationAmt}
    
    ${int variable}=    Set Variable    ${campaignAmt}
    ${campaignAmtCart}=      Format String     {:,}    ${int_variable}
    
    Footer Cart Amout Hidder click
    Sleep    5s     
    My Next Payment Proceed Button 
    Sleep    5s    
    Shadown Cart Total Amount    ${TotalCartAmt}
    Shadown Window OTD Product verify    ${OnetimeDonationName}
    
    ${paymentFrequency}=    Get Payment Frequency    ${campaignName}    
    My Next Payment Allow To Auto Debit click        
    ${Frequency}=    Payment Frequency Convertion    ${paymentFrequency}

    Select From List By Label    id=overall_child_due_quantity    ${Frequency}    

    ${BGColour}=    Get CSS Attribute Value    locator=//p[@class='si_title' and contains(text(),'${campaignName}')]/parent::div/parent::div/parent::div    attribute=background-color
    Should Contain    ${BGColour}    ${SICartColour}

    Shadown Window Product verify    ${campaignName}
    Shadown Cart Total Amount    ${campaignAmtCart}   
    
    My Next Payment SI Proceed To Autopay
    Sleep    5s            
    Element Status Check    xpath=//h5[@id='TotalAmtOfOrder']/b[contains(text(),'${campaignAmt}')]    Campaign Amount is visible in Payment gateway    Campaign Amount is not visible in Payment gateway    

To verify gift a particular child using default amount in make my payment page
    [Tags]    Make Payment Page - GIFT TAB
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Next Payment MainMenu and SubMenu    Gifts    Gift for the Child    
    Click Gift 500Rs    
    Gift For The Child Apply Gift Button
    Sleep    5s    
    Click Select All
    ${childName}=    Get Text    xpath=(//div[@id='GiftfortheChild']//div[@class='cld-nme']/p)[1]
    Click Child Gift Amount    ${childName}
    Sleep    5s    
    ${ChildAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    My Next Payment Proceed Button    
    Shadown Window OTD Product verify    ${childName}
    Shadown Cart Total Amount    ${ChildAmt}
    My Next Payment Add to cart
    Success text in shadow window
    Click Proceed To Checkout Button
    ${cart_quanity}    check in view cart page - One time donation flow    ${childName}    ${ChildAmt}
    View cart proceed button
    CCavenue payment success flow
    CCavenue payment - cart verification    ${childName}    ${ChildAmt}    ${cart_quanity}

To verify select payment package for a child using Drop down in shadow pop window 
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']
    
    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${childName}=    Select Child Paid Not As SI in My Next Payment Page
    ${ChildAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    
    Footer Cart Amout Hidder click
    Sleep    5s    
    My Next Payment Proceed Button     
    Sleep    5s    
    Shadown Cart Total Amount    ${ChildAmt}
    Shadown Window Product verify    ${childName}
    
    ###Seleting Donation amount from DropDown###
    Select From List By Label    class=due_month_dropdown    ${NewPrice}
        
    ${SelectedPrice}=    Convert to price    ${NewPrice}
    ${int variable}=    Set Variable    ${SelectedPrice}
    ${NewChildAmt}=      Format String     {:,}    ${int_variable}
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[@class='cld-amount-pyble']/span[contains(text(),'${NewChildAmt}')]        
    Run Keyword If    '${status}'!='True'    Fail    Cart Price is not updated    ELSE    Log    cart price is update to selected amount    
    My Next Payment Add to cart
    Success text in shadow window
    Click Proceed To Checkout Button
    ${cart_quanity}    check in view cart page - Checkout flow    ${childName}    ${NewChildAmt}
    View cart proceed button
    CCavenue payment success flow
    CCavenue payment - cart verification    ${childName}    ${NewChildAmt}    ${cart_quanity}
    

To verify select payment package for a campaign using Drop down in shadow pop window 
    [Tags]    Make Payment Page
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Children Bucket Uncheck
    My Campaign Bucket Uncheck
    My Donation Bucket Uncheck
    Scroll Element Into View    xpath=//a[text()='Donation']
    
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    ${campaignName}=    Select campaign Not Paid As SI in My Next Payment Page
    ${campaignAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    
    Footer Cart Amout Hidder click
    Sleep    5s    
    My Next Payment Proceed Button     
    Sleep    5s    
    Shadown Cart Total Amount    ${campaignAmt}
    Shadown Window Product verify    ${campaignName}
    
    Select From List By Label    class=due_month_dropdown    ${NewCampaignPrice}
    
    ${SelectedPrice}=    Convert to price    ${NewCampaignPrice}
    ${int variable}=    Set Variable    ${SelectedPrice}
    ${NewCamapignAmt}=      Format String     {:,}    ${int_variable}
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[@class='cld-amount-pyble']/span[contains(text(),'${NewCamapignAmt}')]        
    Run Keyword If    '${status}'!='True'    Fail    Cart Price is not updated    ELSE    Log    cart price is update to selected amount    
    My Next Payment Add to cart
    Success text in shadow window
    Click Proceed To Checkout Button
    ${cart_quanity}    check in view cart page - Checkout flow    ${campaignName}    ${NewCamapignAmt}
    View cart proceed button
    CCavenue payment success flow
    CCavenue payment - cart verification    ${campaignName}    ${NewCamapignAmt}    ${cart_quanity}

To verify gift a particular child using manually given amount in make my payment page
    [Tags]    Make Payment Page - GIFT TAB
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    My Next Payment 
    My Next Payment MainMenu and SubMenu    Gifts    Gift for the Child    
    Click Edit Gift Amount
    Enter Gift Amount    501
    Gift For The Child Apply Gift Button
    Sleep    5s    
    Click Select All
    ${childName}=    Get Text    xpath=(//div[@id='GiftfortheChild']//div[@class='cld-nme']/p)[1]
    Click Child Gift Amount    ${childName}
    Sleep    5s    
    ${ChildAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    My Next Payment Proceed Button    
    Shadown Window OTD Product verify    ${childName}
    Shadown Cart Total Amount    ${ChildAmt}
    My Next Payment Add to cart
    Success text in shadow window
    Click Proceed To Checkout Button
    ${cart_quanity}    check in view cart page - One time donation flow    ${childName}    ${ChildAmt}
    View cart proceed button
    CCavenue payment success flow
    CCavenue payment - cart verification    ${childName}    ${ChildAmt}    ${cart_quanity}

To verify gift all child using manually given amount in make my payment page
    [Tags]    Make Payment Page - GIFT TAB
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    Click Cart
    Cart campaign check and delete
    My Next Payment 
    My Next Payment MainMenu and SubMenu    Gifts    Gift for the Child    
    Click Edit Gift Amount
    Enter Gift Amount    501
    Gift For The Child Apply Gift Button
    Sleep    5s
    
    ${checkbox}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=//div[@id='GiftfortheChild']//div[@class='selectallchi']//input
    Run Keyword If    '${checkbox}'!='True'    Fail    Checkbox is not selected    ELSE    Log    Checkbox is selected    

    ${GiftAmt}=    Get Element Attribute    xpath=//div[@id='GiftfortheChild']//input[@id='bdaygift']    value

    @{childName}=    Create List
    @{childAmt}=    Create List

    ${childCount}=    Get Element Count    xpath=//div[@id='GiftfortheChild']//div[@class='cld-nme']/p
    FOR    ${child}    IN RANGE    1    ${childCount}+1
        Gift child checkbox verify    ${child}
        ${GetchildName}=    Get Text    xpath=(//div[@id='GiftfortheChild']//div[@class='cld-nme']/p)[${child}]
        Append To List    ${childName}    ${GetchildName}
        ${GetChildAmt}=    Get Element Attribute    xpath=//div[@id='GiftfortheChild']//div[@class='cld-nme']/p[contains(text(),'${GetchildName}')]/parent::div/parent::div/following-sibling::div//input    value        
        Append To List    ${childAmt}    ${GetChildAmt}
    END
    
    Log List    ${childName}   
    Log List    ${childAmt}  
    
    ${TotalAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    
    My Next Payment Proceed Button  

    FOR    ${child}    IN    @{childName}
        Shadown Window OTD Product verify    ${child}
    END    
    
    FOR    ${i}    IN RANGE    1    ${childCount}+1
        ${cartValue}=    Get Element Attribute    xpath=(//input[@class='giftChildAmtInp'])[${i}]    value
        Should Be Equal As Strings    ${cartValue}    ${GiftAmt}
    END

    Shadown Cart Total Amount    ${TotalAmt}
    My Next Payment Add to cart
    Success text in shadow window
    Click Proceed To Checkout Button
    
    FOR    ${element}    IN    @{childName}
        ${cart_quanity}    check in view cart page - One time donation flow    ${element}    ${GiftAmt}
    END
    View cart proceed button
    CCavenue payment success flow
    
    FOR    ${element}    IN    @{childName}
        CCavenue payment - cart verification - dynamic    ${element}    ${GiftAmt}    ${cart_quanity}
    END



To verify gift all child using default amount in make my payment page
    [Tags]    Make Payment Page - GIFT TAB
    
    Jenkins browser launch
    Click Login
    Direct login for Make Payment
    Click Cart
    Cart campaign check and delete
    My Next Payment 
    My Next Payment MainMenu and SubMenu    Gifts    Gift for the Child    
    Click Gift 500Rs    
    Gift For The Child Apply Gift Button
    Sleep    5s
    
    ${checkbox}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=//div[@id='GiftfortheChild']//div[@class='selectallchi']//input
    Run Keyword If    '${checkbox}'!='True'    Fail    Checkbox is not selected    ELSE    Log    Checkbox is selected    

    ${GiftAmt}=    Get Element Attribute    xpath=//div[@id='GiftfortheChild']//input[@id='bdaygift']    value

    @{childName}=    Create List
    @{childAmt}=    Create List

    ${childCount}=    Get Element Count    xpath=//div[@id='GiftfortheChild']//div[@class='cld-nme']/p
    FOR    ${child}    IN RANGE    1    ${childCount}+1
        Gift child checkbox verify    ${child}
        ${GetchildName}=    Get Text    xpath=(//div[@id='GiftfortheChild']//div[@class='cld-nme']/p)[${child}]
        Append To List    ${childName}    ${GetchildName}
        ${GetChildAmt}=    Get Element Attribute    xpath=//div[@id='GiftfortheChild']//div[@class='cld-nme']/p[contains(text(),'${GetchildName}')]/parent::div/parent::div/following-sibling::div//input    value        
        Append To List    ${childAmt}    ${GetChildAmt}
    END
    
    Log List    ${childName}   
    Log List    ${childAmt}  
    
    ${TotalAmt}=    Get Text    xpath=//div[@class='bottom-stickey']//span[@class='childCart_total_amount']
    
    My Next Payment Proceed Button  

    FOR    ${child}    IN    @{childName}
        Shadown Window OTD Product verify    ${child}
    END    
    
    FOR    ${i}    IN RANGE    1    ${childCount}+1
        ${cartValue}=    Get Element Attribute    xpath=(//input[@class='giftChildAmtInp'])[${i}]    value
        Should Be Equal As Strings    ${cartValue}    ${GiftAmt}
    END

    Shadown Cart Total Amount    ${TotalAmt}
    My Next Payment Add to cart
    Success text in shadow window
    Click Proceed To Checkout Button
    
    FOR    ${element}    IN    @{childName}
        ${cart_quanity}    check in view cart page - One time donation flow    ${element}    ${GiftAmt}
    END
    View cart proceed button
    CCavenue payment success flow

    FOR    ${element}    IN    @{childName}
        CCavenue payment - cart verification - dynamic    ${element}    ${GiftAmt}    ${cart_quanity}
    END    

To verify all fields are loading properly in registration page
    [Tags]    Registration Pages
        
    Jenkins browser launch
    Click Register
    FOR    ${element}    IN    @{RegisterFieldCheck}
        Scroll Element Into View    ${element}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=${element}
        Run Keyword If    '${status}'!='True'    Fail    Element is not visible    ELSE    Log    Element is visible
    END
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //label[@for='indctzn']
    Run Keyword If    '${status}'!='True'    Fail    Element is not visible    ELSE    Log    Element is visible
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //label[@for='othctzn']
    Run Keyword If    '${status}'!='True'    Fail    Element is not visible    ELSE    Log    Element is visible
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    class=singUpRegister
    Run Keyword If    '${status}'!='True'    Fail    Element is not visible    ELSE    Log    Element is visible

To verify functionality of passport upload for other passport holder
    [Tags]    My Profile
    
    Jenkins browser launch
    Click Login
    Direct login - Other passport user
    MyProfile Edit
    ${title}=    Get Title
    Should Contain    ${title}    TestFname
    MyProfile Passport Photo Check
    Upload Passport Photo
    Verify Image is uploaded
    MyProfile Submit Button
    MyProfile Success Message
    MyProfile Passport Image Remove
    
To verify functionality of passport upload for Indian passport holder
    [Tags]    My Profile
    
    Jenkins browser launch
    Click Login
    Direct login
    MyProfile Edit
    ${title}=    Get Title
    Should Contain    ${title}    Tester
    Verify Upload Passport Photo Disabled
    
To verify functionality of passport upload for other passport holder in registration page
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Register
    #Click Other Passport
    Scroll Element Into View    xpath=//label[@for='othctzn']
    Click Element    xpath=//label[@for='othctzn']    
    Upload Passport Photo
    Verify Image is uploaded
    Click Element    xpath=//input[contains(@id,'edit-field-passport-photo-0-remove-button')]     

To verify functionality of passport upload for indian passport holder in registration page
    [Tags]    Registration Page
    
    Jenkins browser launch
    Click Register
    #Click Other Passport
    Scroll Element Into View    xpath=//label[@for='indctzn']
    Click Element    xpath=//label[@for='indctzn']
    Verify Upload Passport Photo Disabled

To verify MyCampaign in Next Payment page is added in MyCampaign Page
    [Tags]    My Campaign Page
    
    Jenkins browser launch
    Click Login
    Direct login
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    
    ${mylist} =    Create List    
    @{campaigns}=    Get WebElements    xpath=//div[contains(@class,'campaign chld-items')]//div[@class='cld-nme']/p
    FOR    ${element}    IN    @{campaigns}
        ${campaign}=    Get Text    ${element}
        Append To List    ${mylist}    ${campaign}
    END
    Click Element    xpath=//div[@class='main-menu-inner']//li/a[contains(text(),'My Campaign')]
    FOR    ${element}    IN    @{mylist}                 
        ${list_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='user_campheading']/a[contains(text(),'${element}')]    
        Run Keyword If    ${True}==${list_status}    Log    "My next payment camapigns are visible in My campaign page"    ELSE    Fail    "My next payment camapigns are not visible in My campaign page"
    END

To verify Paid date for child in MyChild page
    [Tags]    MyChild Page
    
    Jenkins browser launch
    Click Login
    Direct login
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Children
    ${childName}=    Get Text    xpath=(//div[contains(@class,'child chld-items')])[1]//div[@class='cld-nme']/p
    ${DueDate}=    Get Text    xpath=(//div[contains(@class,'child chld-items')])[1]//span
    Click MyChild
    Select Child in MyChild Page    ${childName}
    ${month}=    Get Substring    ${DueDate}    3    6
    ${NewMonth}=    Convert Text Month To Numbers    ${month}       
    ${DueDateMyNextPayment}=    Replace String    ${Duedate}    ${month}    ${NewMonth}
    Log To Console    ${DueDateMyNextPayment}  
    Click MyProfile In MyChild Page 
    Sleep    5s    
    ${DueDateChildPage}=    Get Text    xpath=//span[@class='choosen_month_quarter']
    Should Not Be Empty    ${DueDateChildPage}    
    Should Be Equal    ${DueDateMyNextPayment}    ${DueDateChildPage}

To verify sponsorship history in campaign page
    [Tags]    My campaign
    
    Jenkins browser launch
    Click Login
    Direct login
    Mouse hover ways to give after login    Educate Children
    Element Status Check    class=timeline__wrap    Campaign Payment history is visible    Campaign Payment history is not visible
    
To verify gift section in my next payment page
    [Tags]    Make Payment Page - GIFT TAB
    
    Jenkins browser launch
    Click Login
    Direct login
    My Next Payment
    Click Gift Menu
    Gift Submenu list verify

To verify make payment button in my child page
    [Tags]    My child Page
    
    Jenkins browser launch
    Click Login
    Direct login
    Click MyChild
    Wait Until Element Is Visible    xpath=(//div[@class='child_name heartbeat'])[1]    60s
    Click Element    xpath=(//div[@class='child_name heartbeat'])[1]
    Sleep    10s    
    Verify MyChild Menu 
    Click MyProfile In MyChild Page 
    Element Status Check    id=makePayment    Make Payment Button is visible    Make Payment Button is not visible
    ${status}=    Run Keyword And Return Status    Element Should Be Enabled    id=makePayment
    Run Keyword If    '${status}'!='True'    Fail    Make Payment Button is Disabled    ELSE    Log    Make Payment Button is Enabled

To verify ilustration functionality if campaign is not available in mycampaign page
    [Tags]    My Campaign Page
    
    Jenkins browser launch
    Click Login
    Direct login
    My Next Payment
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns
    ${count}=    Get Element Count    xpath=//div[contains(@class,'campaign chld-items')]//div[@class='cld-nme']/p
    Run Keyword If    ${count}>0    Log    Campaigns are available in my campagin section    ELSE    Verify Illustartion in my campaign page
    
Verify user should able to change and update password
    [Tags]    My Profile
    
    Jenkins browser launch
    Click Login
    Direct login
    MyProfile Edit
    ${newUpdatedPasswd}=    Change Password in My profile Page    ${newPassword}    ${newPassword}
    MyProfile Submit Button
    Password Updated Message
    Logout
    Enter Username and Password    9999999995    ${newUpdatedPasswd}
    Verify Page Title    My World
    MyProfile Edit
    Reset Password in My profile Page    ${newPassword}    ${newPassword}
    MyProfile Submit Button

*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    .5s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Call Method    ${chrome_options}    add_argument    incognito
    Call Method    ${chrome_options}    add_argument    disable-notifications
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${baseurl}
    Set Browser Implicit Wait    60s
    
Jenkins browser launch - Without Incognito
    Set Selenium Speed    .5s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver    
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Call Method    ${chrome_options}    add_argument    disable-notifications
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${baseurl}
    Set Browser Implicit Wait    20s    

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
    Sleep    5s    
    Click Element    xpath=//input[@id='edit-checkout']

Mouser hover ways to give campaign
    [Arguments]    ${edu_child}
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Ways to Give')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'${edu_child}')]

Ensure default amount in educational need
    ${get_val}=    Get Element Attribute    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]    value
    #Log To Console    Input value is: ${get_val}
    Run Keyword If    '1000'!='${get_val}'    Fail    "Default value '1000' not display"

Error default value and check button disable
    Click Element    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]       
    Clear Element Text    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]
    Input Text    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]    99
    ${chck_button_disable}=    Element Should Be Disabled    xpath=//div[@class='kl_flood_sub_or_sec']/input[1]
    #${chck_button_disable}=    Get Element Attribute    xpath=//div[@class='kl_flood_sub_or_sec']/input[1]    disabled
    Log To Console    Diabled value is:${chck_button_disable}
    Run Keyword If    '${chck_button_disable}'!='true'    Fail    "Enter amount '99' but 'ADD TO CART' button not in disable mode"
    Input Text    xpath=//div[@class='realgift_input_value commerce_manual_inputs']/input[1]    ${real_gift_enter_val}

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
    Sleep    10s     
    ${gift_cart_msg1}=    Get Text    xpath=//span[@class='badge notification_badge']
    ${gift_cart_msg1}=    Convert To Integer    ${gift_cart_msg1}
    Run Keyword If    ${gift_cart_msg1}>=1    Click Element    xpath=(.//a[@class='remove-btn'])[1]    ELSE    Log To Console    "Cleared Cart"    
    #${gift_cart_msg}=    Get Text    xpath=//div[@class='Empty_basket_Content']/h1  
    Sleep    10s              
    ${gift_cart_msg1}=    Get Text    xpath=//span[@class='badge notification_badge']
    ${gift_cart_msg1}=    Convert To Integer    ${gift_cart_msg1}  
    Log To Console    ${gift_cart_msg1}      
    Run Keyword If    ${gift_cart_msg1}>=1    Fail    "Your cart have some order left"
    #Run Keyword If    '${gift_cart_msg}'!='Your Gift Cart is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart Is Empty' text not display" 

Login
    Click Element   xpath=//input[@id='edit-login-custom-returning-customer-name']
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-name']    ${user_name}
    Click Element   xpath=//input[@id='edit-login-custom-returning-customer-password']
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-password']    ${password}
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    
  
Direct login
    Sleep   8s
    Click Element    id=edit-name
    Input Text    id=edit-name    ${user_name}
    Click Element    id=edit-pass
    Input Text    id=edit-pass    ${password}
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    
SI login
    Wait Until Element Is Visible    xpath=//input[contains(@id,'exampleInputEmail')]    30s
    Click Element    xpath=//input[contains(@id,'exampleInputEmail')]    
    Input Text    xpath=//input[contains(@id,'exampleInputEmail')]    ${user_name}  
    Click Element    xpath=//input[contains(@id,'exampleInputPassword')]
    Input Text    xpath=//input[contains(@id,'exampleInputPassword')]    ${password}
    
    Sleep    10s    
    Click Element    id=si_login_btn
    
    Wait Until Element Is Visible    class=safeNsecure    60s        
    ${si_postlogin_chck}=    Run Keyword And Return Status    Element Should Be Visible    class=safeNsecure
    Run Keyword If    'True'!='${si_postlogin_chck}'    Fail    "SI flow Postlogin page not display"

CCavenue payment success flow
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Sleep    15s
    Click Element    //button[text()='pay my contribution']        
    Wait Until Element Is Visible    xpath=(//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]    15s    
    Click Element    xpath=(//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(//span[starts-with(text(),'Make')])[3]
    Click Element    xpath=//input[@type='submit']      
    Banner Alert
    ${title}=    Get Title
    Should Contain    ${title}    Complete
    ${payment_success_msg}=    Get Text    xpath=//div[@id='edit-completion-message']//h3
    Run Keyword If    'PAYMENT SUCCESSFULL'!='${payment_success_msg}'    Fail    "Payment successful page not display"
    
Educate children campaign with checkout flow
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Educate Children')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep    5s
    ${educate_chld_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div/p
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
    Sleep    5s    
    ${camp_name}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div/p
    ${label_val}=    Get Text    xpath=//label[contains(text(),'3 Months')]     
    ${Camp_amt}=    Get Substring    ${label_val}    9    16
    Log To Console    Final val is: ${camp_amt}
    
    Wait Until Element Is Visible    xpath=//label[contains(text(),'3 Months')]    30s    
    Click Element    xpath=//label[contains(text(),'3 Months')]
    Sleep    10s    
    Click SI CheckBox
    Add to cart text change
    Click Add To Cart
    Success text in shadow window
    Click Proceed To Checkout Button
    
    [Return]    ${camp_name}    ${camp_amt}

SI flow campaign
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    Wait Until Element Is Visible    xpath=//div[@class='inner_banner_pledge_content']/h2/div/p    60s
    ${camp_name}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div/p
    ${label_val}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    ${final_val}=    Get Substring    ${label_val}    9    16
    Log To Console    Final val is:${final_val}
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    ${status}=    Run Keyword And Return Status    Checkbox Should Be Selected    id=ChkForSI    
    Run Keyword If    'True'!='${status}'    Fail    'Auto Pay check box was not selected'    ELSE    Log To Console    'Checkbox selected by default'    
    Click Element    xpath=//button[@class='btn btn-primary si_modal_btn']
    
one time campaign
    Sleep    10s    
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep   5s
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    Sleep    5s    
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    id=ChkForSI
    
    Add to cart text change
    Add to cart functionality

    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Sleep    5s    

    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//a[@class='view_cart']
    ${camp_val}=    Replace String    ${edu_child_amt}    4    4,
    
    [Return]    ${camp_name}    ${camp_val}
    
One time Hunger Free campaign
    Mouser hover ways to give campaign    Hungerfree
    Sleep    10s
    Click Element    xpath=.//div[@class='add-to-cart-section']
    Sleep    5s    
    ${hunger_camp_name}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div
    ${campName}=    Remove String    ${hunger_camp_name}    Free
    Log    Campaign Name: ${campName}    
    ${input_val}=    Get Element Attribute    xpath=.//input[@name='manualCart[0][amount]']    value
    ${replace_val}=    Replace String    ${input_val}    1    1,   
    Log    Campaign Amount: ${replace_val}
    Click Add To Cart
    Sleep   5s
    Success text in shadow window
    Click Proceed To Checkout Button
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${campName}')]
    Run Keyword If    'True'!='${status}'    Fail    "Hunger Free campaign not display in view cart page"    
     
    ${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${replace_val}')]    
    #${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'â‚¹${replace_val}')]
    Run Keyword If    'True'!='${hunger_camp_amt_viewcart}'    Fail    "Hunger Free campaign amount are not display/mismatch in view cart page"
    
    [Return]    ${input_val}    ${campName}
    
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
    #${get_viewcart_list_count}=    Set Variable    ${get_viewcart_list_count + 1}      
    FOR    ${index}    IN RANGE    ${get_viewcart_list_count}    0    -1    
        Click Element    xpath=(//a[@class='remove-btn'])[${index}]    
        Sleep    5s    
    END           
    ${check_cartpage_after_complete_del}=   Get Text    xpath=//div[@class='Empty_basket_Content']/h1    
    Run Keyword If    '${check_cartpage_after_complete_del}'!='Your Gift Cart is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart is Empty' text not display"

Remove symbol
    [Arguments]    ${val}    ${sysmbol}
    ${output}=    Remove String    ${val}    ${sysmbol}
    [Return]    ${output}

CCAvenue payment failure flow
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Sleep    30s
    Click Element    xpath=//div[@id='edit-actions']/button[contains(text(),'pay my contribution')]
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Wait Until Element Is Visible    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]   15s
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Select From List By Value    xpath=.//select[@name='PAID']    N
    Click Element    xpath=.//input[@type='submit']
    ${payment_msg}=    Get Text    xpath=.//div[@class='content block-content']/div/h3/span
    ${Payment_msg}=    Remove String Using Regexp    ${payment_msg}    \\W*\\d*
    Log To Console    Payment failure text: ${payment_msg}
    Run Keyword If    'PAYMENTFAILED'!='${payment_msg}'    Fail    "Payment Failure page not display"

Payment failure check in home page banner
    [Arguments]    ${content}
    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    ${banner_count}=    Convert To Integer    ${banner_count}    
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        Capture Page Screenshot
        ${status}=    Run Keyword And Return Status    Element Should Contain    xpath=//div[@class='banner-content']/a[contains(text(),'${content}')]    ${content}            
        Run Keyword If    '${status}'=='True'    Log To Console    Payment Failure banner is visible    
        Exit For Loop If    '${status}'=='True'
    END            
    Run Keyword If    '${status}'!='True'    Fail    Payment failure banner was not found

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
    ${get_child_count}=    Get Element Count    xpath=//div[@class='card-detail']//span[@class='chi-name']
    ${check}=    Evaluate    ${get_child_count}+1
    FOR    ${index}    IN RANGE    1    ${check}
        ${ChildInRotator}=    Get Text    xpath=//div[@class='card-detail']//span[@class='chi-name']
        Run Keyword If    '${ChildInRotator}'=='${sel_child}'    Fail    "Child are duplicate"
    END
    
Ways to give - 5 items
    [Arguments]    ${sponcer}
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'${sponcer}')])[1]  
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    ${educate_chld_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
        #Click Auto credit
    Sleep    10s    
    Click Element    id=ChkForSI
        #enter Amount
    Click Element    xpath=//input[contains(@class,'commerce_manual_input realgift_inputvalue realgift_input')]
    Input Text    xpath=//input[contains(@class,'commerce_manual_input realgift_inputvalue realgift_input')]    1000000    
        #Add to cart
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
        #Proceed to cart
    Click Element    xpath=//a[@class='view_cart']    
    Banner Alert

Rotator Child Details
    Sleep    15s
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    id=myCarousel
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"
    
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//div[@class='stepwizard-row setup-panel']/div[3]/div/label    
    ${child_name}=    Get Text    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//h4  
    ${child_name}=    Remove String Using Regexp    ${child_name}    \,.*$         
    ${sel_child_amt}=    Get Text    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//p[@class='pricemnth active']//span[@class='home-price']
    ${sel_child_amt}=    Remove String    ${sel_child_amt}     .00
    ${sel_child_imgsrc}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']/div/div[1]/div[1]/div/img    src
    [Return]    ${child_name}    ${sel_child_amt}    ${sel_child_imgsrc}

Rotator Payment validation
    [Arguments]    ${sel_child_imgsrc}
    Sleep    15s    
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//label[@class='chkSIlabel']
    ${footer_proceed_btn}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[@id='edit-submit--12']    value
    Run Keyword If    '${footer_proceed_btn}'!='SPONSOR NOW'    Fail    "After Allow Auto Debit button click it will not change into 'Sponsor Now' text"
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[@id='edit-submit--12']
    ${child_sponsor_msg}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${child_sponsor_msg}'!='Success !'    Fail    "After child selected 'Sponsor Successfull' text not display"
    ${Sponsor_success_img_chck}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']/div/div[1]/div[1]/div/img    src
    Run Keyword If    '${Sponsor_success_img_chck}'!='${sel_child_imgsrc}'    Fail    "Footer selected child and sponsor successs child image are not match"
   
Rotator Child cart validation 
    [Arguments]    ${child_name}    ${sel_child_amt}
    ${chck_child_name}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${child_name}')]
    Run Keyword If    'True'!='${chck_child_name}'    Fail    "Choosed child not display in view cart page"
    ${chck_child_amt}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${sel_child_amt}')]
    Run Keyword If    'True'!='${chck_child_amt}'    Fail    "Choosed child amount are mismatch in view cart page"
    
Banner Alert
    ${banner_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[@class='refer-cls'])[1]/img    
    Run Keyword If    'True'=='${banner_status}'    Click Element    xpath=(//div[@class='refer-cls'])[1]/img     ELSE    Log To Console    "Banner was not present"    

Direct login - Other passport user
    Click Element    id=edit-name
    Input Text    id=edit-name    testmail@test.com
    Click Element    id=edit-pass
    Input Text    id=edit-pass    test
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]    
    
MyProfile Edit
    View Myprofile
    Click Element    xpath=.//a[contains(.,'Edit Profile')]
    Scroll Element Into View    xpath=.//label[@for='edit-field-nationality']
   
Check other passport holder
    ${OtherPassStatus}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//label[@for='othctzn']        
    Run Keyword If    'True'!='${OtherPassStatus}'    Fail    "INDIAN User can able to select other passport user"
    View Myprofile    

Check indian passport holder
    ${indianPassStatus}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//input[@id='indctzn']        
    Run Keyword If    'True'!='${indianPassStatus}'    Fail    "OTHER PASSPORT User can able to select Indian Citizen"
    View Myprofile 
    
Navigation banner close   
    ${nav_banner_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='mySidenav']/a    
    Run Keyword If    'True'=='${nav_banner_status}'    Click Element    xpath=//div[@id='mySidenav']/a     ELSE    Log To Console    "Nav banner was not present" 
 
MyCampaign List
    @{mycampaign}=    Get WebElements    xpath=//div[@class='userCampHolder']//a
    FOR    ${element}    IN    @{mycampaign}
        ${text}=    Get Text    ${element}
        Log To Console    My campaign lists are: ${text}   
    END 
    
Overview List
    @{overview_list}=    Get WebElements    class=Way_give_title
    FOR    ${element}    IN    @{overview_list}
        ${text}=    Get Text    ${element}
        Log To Console    Overview lists are: ${text}   
    END
    
Registration - Indian
    
    Click Element    xpath=//a[contains(text(),'Register')]
    
    Select From List By Label    id=edit-field-title    Mr.
    
    Input Text    id=edit-field-first-name-0-value    john
    #last name
    Input Text    id=edit-field-last-name-0-value    kennedy
    #Email
    Input Text    id=edit-mail    john@john.com
    #Phone no
    Input Text    id=edit-field-mobile-verify-0-mobile    6666666666
    #confirm password
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[text()='Password']    
    Input Text    id=edit-pass-pass1    john
    #Re-confirm
    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[text()='Confirm Password']
    Input Text    id=edit-pass-pass2    john
    #Address 1
    Input Text    id=edit-field-registeraddress-0-value    Test Address 1
    #Address 2
    Input Text    id=edit-field-address-2-0-value    Test address 2
    #Address 3
    Input Text    id=edit-field-address-3-0-value    Test address 3
    #Postal code
    Input Text    id=edit-field-pin-code-0-value    600130
    #How Do you Know - Newly added
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    id=edit-field-how-do-you-know-about-worl    Friends and Family        
    #DOB
    Click Element    xpath=//label[text()='Date of Birth']
    Select From List By Label    xpath=//select[@class='ui-datepicker-year']    1989
    Select From List By Label    xpath=//select[@class='ui-datepicker-month']    Oct
    Click Element    xpath=(//table//tbody/tr/td/a)[11]
    
    Click Element    id=user-register-form    
    
    Click Element    class=singUpRegister    

Registration - Indian - Test
    
    Click Element    xpath=//a[contains(text(),'Register')]
    
    Select From List By Label    id=edit-field-title    Mr.
    
    Input Text    id=edit-field-first-name-0-value    john
    #last name
    Input Text    id=edit-field-last-name-0-value    kennedy
    #Email
    Input Text    id=edit-mail    aswin.l@live.in
    #Phone no
    Input Text    id=edit-field-mobile-verify-0-mobile    8056230775
    #confirm password
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    john
    #Re-confirm
    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[@for='edit-pass-pass2']
    Input Text    id=edit-pass-pass2    john
    #Address 1
    Input Text    id=edit-field-registeraddress-0-value    Test Address 1
    #Address 2
    Input Text    id=edit-field-address-2-0-value    Test address 2
    #Address 3
    Input Text    id=edit-field-address-3-0-value    Test address 3
    #Postal code
    Input Text    id=edit-field-pin-code-0-value    600130
    #How Do you Know - Newly added
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    id=edit-field-how-do-you-know-about-worl    Friends and Family        
    #DOB
    Click Element    xpath=//label[text()='Date of Birth']
    Select From List By Label    xpath=//select[@class='ui-datepicker-year']    1989
    Select From List By Label    xpath=//select[@class='ui-datepicker-month']    Oct
    Click Element    xpath=(//table//tbody/tr/td/a)[11]
    
    Click Element    id=user-register-form    
    
    Click Element    class=singUpRegister

one time campaign - Save malnourshied Children Campaign
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep   5s
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div   
    ${camp_name}=   Replace String    ${camp_name}    M    m
    ${camp_name}=   Replace String    ${camp_name}    C    c
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    id=ChkForSI
    
    Add to cart text change
    Add to cart functionality
    
    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Sleep    5s    
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//a[@class='view_cart']
    ${camp_val}=    Replace String    ${edu_child_amt}    4    4,
    [Return]    ${camp_name}    ${camp_val}

Cart addition check
    ${price_std}=    Get Text    xpath=//td[@class='views-field views-field-total-price__number-2']
    ${price_std}=    Remove String Using Regexp    ${price_std}    \\D        
    ${price_std}=    Convert To Integer    ${price_std}
    Log To Console    Standard price: ${price_std}     
    
    FOR    ${element}    IN RANGE    1    3
        Sleep    5s    
        Click Element    class=save-plus    
    END
    
    Sleep    10s    
    ${quantity}=    Get Element Attribute    xpath=//span[@class='dynamic-quantity']/div/input    value
    Log To Console    quanity of payment: ${quantity}    
    ${quantity}=    Convert To Integer    ${quantity}    
    ${total_cal}=    Evaluate    ${price_std}*${quantity} 
    
    ${total_cart}=    Get Text    xpath=//td[@headers='view-total-price-number-table-column']
    ${total_cart}=    Remove String Using Regexp    ${total_cart}    \\D        
    ${total_cart}=    Convert To Integer    ${total_cart}   
    Log To Console    Total cart value: ${total_cal}        

    Should Be Equal As Integers    ${total_cal}    ${total_cart}

Cart reduce check
    ${price_std}=    Get Text    xpath=//td[@class='views-field views-field-total-price__number-2']
    ${price_std}=    Remove String Using Regexp    ${price_std}    \\D        
    ${price_std}=    Convert To Integer    ${price_std}
    Log To Console    Standard price: ${price_std}     
    
    FOR    ${element}    IN RANGE    3    1    -1
        Sleep    5s    
        Click Element    class=save-minus    
    END
    
    Sleep    10s    
    ${quantity}=    Get Element Attribute    xpath=//span[@class='dynamic-quantity']/div/input    value
    Log To Console    quanity of payment: ${quantity}    
    ${quantity}=    Convert To Integer    ${quantity}    
    ${total_cal}=    Evaluate    ${price_std}*${quantity} 
    
    ${total_cart}=    Get Text    xpath=//td[@headers='view-total-price-number-table-column']
    ${total_cart}=    Remove String Using Regexp    ${total_cart}    \\D        
    ${total_cart}=    Convert To Integer    ${total_cart}   
    Log To Console    Total cart value: ${total_cal}        

    Should Be Equal As Integers    ${total_cal}    ${total_cart}

Clear and input text
    [Arguments]    ${text}
    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${text}

Add to cart text change
    ${button_text}=    Get Element Attribute    xpath=//div[@class='kl_flood_sub_or_sec']/input    value
    Run Keyword If    'Add to cart'=='${button_text}'    Log To Console    "Button changed to ADD TO CART"    ELSE    Fail    "Button was not changed to ADD TO CART"

Add to cart button disable
    ${button_status}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//div[@class='kl_flood_sub_or_sec']/input
    Run Keyword If    'True'=='${button_status}'    Log To Console    "Button is disabled"    ELSE    Fail    "Button was not disabled"

Add to cart button enabled
    ${button_status}=    Run Keyword And Return Status    Element Should Be Enabled    xpath=//div[@class='kl_flood_sub_or_sec']/input
    Run Keyword If    'True'=='${button_status}'    Log To Console    "Button is enabled"    ELSE    Fail    "Button was not enabled"

Add to cart functionality
    
    Clear and input text    ${lesser_amount}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    class=errorMessage
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert is displayed for amount: ${lesser_amount}"    ELSE    Fail    "Minimum donation amount alert was not displayed for amount: ${lesser_amount}"
    Add to cart button disable
    Sleep    5s
    
    Clear and input text    ${minimum_amount}
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    class=errorMessage
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert was not displayed for amount: ${minimum_amount}"    ELSE    Fail    "Minimum donation amount alert is displaying for amount: ${minimum_amount}"
    Add to cart button enabled
    Sleep    5s    

    Clear and input text    ${accurate_amount}
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    class=errorMessage
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert was not displayed for amount: ${accurate_amount}"    ELSE    Fail    "Minimum donation amount alert is displaying for amount: ${accurate_amount}"
    Add to cart button enabled
    Sleep    5s        
    
    Clear and input text    ${maximum_amount}        
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    class=errorMessage
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert was not displayed for amount: ${maximum_amount}    Fail    "Minimum donation amount alert is displaying for amount: ${maximum_amount}"
    Add to cart button enabled
    Sleep    5s
    
    Clear and input text    ${higher_amount}
    ${max_value}=    Get Element Attribute    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    value
    Run Keyword If    '100000'=='${max_value}'    Log To Console    "Given amount '${higher_amount}' is changed to : ${max_value} in webpage"    ELSE    Fail    "Given amount is not changed to "₹100000"      
    Add to cart button enabled
    Sleep    5s

one time campaign - Where Most Needed Campaign
    
    Click Element    xpath=.//div[@class='item-image']//img
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_name}=   Replace String    ${camp_name}    M    m
    ${camp_name}=   Replace String    ${camp_name}    N    n 
    
    Add to cart text change
    Add to cart functionality
                     
    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Sleep    5s    
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//a[@class='view_cart']   
    ${camp_val}=    Replace String    ${edu_child_amt}    4    4,
    [Return]    ${camp_name}    ${camp_val}   
    
one time campaign - Help HIV aids Campaign
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep    10s    
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_name}=    Replace String    ${camp_name}    F    f
    ${camp_name}=    Replace String    ${camp_name}    a    A
    ${camp_name}=    Replace String    ${camp_name}    n    N
    ${camp_name}=    Replace String    ${camp_name}    d    D
    
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    id=ChkForSI
    
    Add to cart text change
    Add to cart functionality
    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}
    Sleep    5s    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    
    Click Element    xpath=//a[@class='view_cart']
    ${camp_val}=    Replace String    ${edu_child_amt}    4    4,
    
    [Return]    ${camp_name}    ${camp_val}
    
one time campaign - Hunger Free campaign
    
    Sleep    10s
    Click Element    xpath=//div[@class='add-to-cart-section']
    Sleep    5s    
    ${camp_name}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_name}=    Remove String    ${camp_name}    Free
    Add to cart text change
    Add to cart functionality
    
    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${edu_child_amt}    
    Sleep    5s    
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
        
    Click Element    xpath=//a[@class='view_cart']
    ${camp_val}=    Replace String    ${edu_child_amt}    4    4,
    
    [Return]    ${camp_name}    ${camp_val}     

check in view cart page - Checkout flow
    [Arguments]    ${camp_name}    ${camp_amt}
        
    ${camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]
    Run Keyword If    'True'!='${camp_viewcart}'    Fail    "${camp_name} campaign not display in view cart page"
    ${camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${camp_amt}')]
    Run Keyword If    'True'!='${camp_amt_viewcart}'    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"   
    ${cart_quanity}=    Get Element Attribute    xpath=//span[@class='dynamic-quantity']//input    value
    
    [Return]    ${cart_quanity}
    
check in view cart page - One time donation flow
    [Arguments]    ${camp_name}    ${camp_amt}
        
    ${camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]
    Run Keyword If    'True'!='${camp_viewcart}'    Fail    "${camp_name} campaign not display in view cart page"
    ${camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'${camp_amt}')]
    Run Keyword If    'True'!='${camp_amt_viewcart}'    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"   
    ${cart_quanity}=    Get Text    class=dynamic-quantity
    
    [Return]    ${cart_quanity}   

CCavenue payment - cart verification
    [Arguments]    ${camp_name}    ${Camp_val}    ${cart_quanity}
    
    Sleep    20s    
    Banner Alert
    ${order_status}=    Get Text   xpath=//div[@class='payment-success-message1']/p
    Log To Console    ${order_status}
        
    ${count}=    Get Element Count    xpath=//td[contains(@class,'views-field-product-id')]
    FOR    ${element}    IN RANGE    1    ${count}+1
        ${status_campaign}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_name}')]
        Run Keyword If    'True'=='${status_campaign}'    Log To Console    "${camp_name}" is displayed in payment page    ELSE    Fail    "${camp_name} was not displayed in payment page"
        
        ${campaign_quanity}=    Get Text    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[2]//span
        Run Keyword If    '${cart_quanity}'=='${campaign_quanity}'    Log To Console    campaign quantity is: ${campaign_quanity}    ELSE    Fail    campaign quantity was not displayed
        
        ${status_price}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[3][contains(text(),'${camp_val}')]
        Run Keyword If    'True'=='${status_price}'    Log To Console    "${camp_val} campaign value is displayed in payment page"    ELSE    Fail    "${camp_val} campaign value was not displayed in payment page"    
    END

Total cart value
    ${total_cart_value}=    Get Text    xpath=//div[contains(@class,'order-total-line__total')]/span[2]
    ${total_cart_value}=    Remove String Using Regexp    ${total_cart_value}    \\D        
    ${total_cart_value}=    Convert To Integer    ${total_cart_value}
    
    [Return]    ${total_cart_value}
    
check in view cart page - dynamic
    [Arguments]    ${camp_name}    ${camp_amt}
        
    ${camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]
    Run Keyword If    'True'!='${camp_viewcart}'    Fail    "${camp_name} campaign not display in view cart page"
    ${camp_amt_viewcart}=    Get Text    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]/following-sibling::td[3]
    ${camp_amt_viewcart}=    Remove String Using Regexp    ${camp_amt_viewcart}    \\D        
    ${camp_amt_viewcart}=    Convert To Integer    ${camp_amt_viewcart}
    Run Keyword If    ${camp_amt}!=${camp_amt_viewcart}    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"   
    ${cart_quanity}=    Get Element Attribute    xpath=//span[@class='dynamic-quantity']//input    value
    
    [Return]    ${cart_quanity}
    
CCavenue payment - cart verification - dynamic
    [Arguments]    ${camp_name}    ${Camp_val}    ${cart_quanity}
    
    Sleep    20s    
    Banner Alert    
    ${order_status}=    Get Text   xpath=//div[@class='payment-success-message1']/p
    Log To Console    ${order_status}
    ${status_campaign}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_name}')]
    Run Keyword If    'True'=='${status_campaign}'    Log To Console    "${camp_name} is displayed in payment page"    ELSE    Fail    "${camp_name} was not displayed in payment page"      
    ${campaign_quanity}=    Get Text    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[2]//span
    Run Keyword If    '${cart_quanity}'=='${campaign_quanity}'    Log To Console    "campaign quantity ${campaign_quanity} is displayed in payment page"    ELSE    Fail    "campaign quantity ${cart_quanity} was not displayed in payment page"   
    # ${status_price}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_val}')]
    # Run Keyword If    'True'=='${status_price}'    Log To Console    "${camp_val} campaign value is displayed in payment page"    ELSE    Fail    "${camp_val} campaign value was not displayed in payment page"
    ${camp_amt_paygt}=    Get Text    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[3]
    ${camp_amt_paygt}=    Remove String Using Regexp    ${camp_amt_paygt}    \\D        
    ${camp_amt_paygt}=    Convert To Integer    ${camp_amt_paygt}
    Run Keyword If    ${Camp_val}!=${camp_amt_paygt}    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"    ELSE    Log To Console    ${camp_name} campaign amount is ${camp_amt_paygt}   
    
Event Page menu check
    [Arguments]    ${submenu}    

    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Media')]    
    ${count}=    Get Element Count    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Media')]//parent::li//li/a        
    Run Keyword If    '${count}'!='4'    Fail    Media submenus are not matching
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Media')]
    @{media_list}=    Get WebElements    xpath=//div[@class='main-menu-inner']//*[contains(text(),'Media')]//parent::li//li/a
    FOR    ${element}    IN    @{media_list}
        ${text}=    Get Text    ${element}
        Log To Console    Media submenus are : ${text} 
    END        
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'${submenu}')]
    
Event Submenu Check
    [Arguments]    ${submenu}
    
    Wait Until Element Is Visible    xpath=//span[contains(text(),'${submenu}')]    30s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[contains(text(),'${submenu}')]    
    Run Keyword If    '${status}'!='True'    Fail    Page doesnt redirect to News Articles

Event page filter
    [Arguments]    ${month}    ${year}    ${language}
    
    Scroll Element Into View    xpath=//input[contains(@id,'edit-submit-press-releases')]
    Select From List By Label    id=edit-field-month-target-id    ${month}
    Select From List By Label    id=edit-field-releases-year-target-id    ${year}
    Select From List By Label    id=edit-field-tags-target-id    ${language}
    
    Click Element    xpath=//input[contains(@id,'edit-submit-press-releases')]

Event page filter verification    
    [Arguments]    ${month_input}    ${year_input}
    
    ${month_sort}=    Get Substring    ${month_input}    0    3
    #Element Should Be Visible    xpath=//div[@class='media-press-page pressres']  
    Scroll Element Into View    xpath=//div[@class='media-press-page']//span[@class='media-mont' and contains(text(),'${month_sort}')]  
    ${month}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='media-press-page']//span[@class='media-mont' and contains(text(),'${month_sort}')]
    Run Keyword If    '${month}'!='True'    Fail    Month mismatch or No data found
    ${year}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='media-press-page']//span[@class='media-year' and contains(text(),'${year_input}')]
    Run Keyword If    '${year}'!='True'    Fail    Year mismatch or No data found

Kerala flood campaign
    [Arguments]    ${value}
    
    Sleep   5s
    ${campaign_name}=    Get Text    xpath=(//div[@class='emergency_flood_relief_content'])[${value}]/div[1]
    ${campaign_amt}=    Get Text    xpath=(//div[@class='emergency_flood_relief_content'])[${value}]/div[4]
    ${campaign_amt}=    Remove String Using Regexp    ${campaign_amt}    \\D        
    ${campaign_amt}=    Convert To Integer    ${campaign_amt}
    Log To Console     Campain name is: ${campaign_name} donation is : ${campaign_amt}
    
    [Return]    ${campaign_name}    ${campaign_amt}

Cart campaign check and delete    
    ${get_viewcart_list_count}=    Get Element Count    xpath=//tbody/tr/td[starts-with(@headers,'view-product-')]        
    ${get_viewcart_list_count}=    Convert To Integer    ${get_viewcart_list_count}            
    Run Keyword If    ${get_viewcart_list_count} < 1    Log To Console    "No campaign in view cart page"    ELSE    Notification deletion    ${get_viewcart_list_count}

CCavenue payment - failure cart verification
    [Arguments]    ${camp_name}    ${Camp_val}    ${cart_quanity}
    
    Sleep    20s    
    Banner Alert                  
    ${payment_msg}=    Get Text    xpath=.//div[@class='content block-content']/div/h3/span
    ${Payment_msg}=    Remove String Using Regexp    ${payment_msg}    \\W*\\d*
    #Log To Console    Payment failure text: ${payment_msg}    
    Run Keyword If    'PAYMENTFAILED'!='${payment_msg}'    Fail    "Payment Failure page not display"     
    ${order_id}=    Get Text    xpath=//div[@class='content block-content']/div/h3/p         
    Log To Console    ${order_id}     
    ${status_campaign}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_name}')]
    Run Keyword If    'True'=='${status_campaign}'    Log To Console    "${camp_name} is displayed in payment page"    ELSE    Fail    "${camp_name} was not displayed in payment page"      
    ${campaign_quanity}=    Get Text    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[2]//span
    Run Keyword If    '${cart_quanity}'=='${campaign_quanity}'    Log To Console    "campaign quantity ${campaign_quanity} is displayed in payment page"    ELSE    Fail    "campaign quantity ${cart_quanity} was not displayed in payment page"   
    # ${status_price}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_val}')]
    # Run Keyword If    'True'=='${status_price}'    Log To Console    "${camp_val} campaign value is displayed in payment page"    ELSE    Fail    "${camp_val} campaign value was not displayed in payment page"
    ${camp_amt_paygt}=    Get Text    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[3]
    ${camp_amt_paygt}=    Remove String Using Regexp    ${camp_amt_paygt}    \\D        
    ${camp_amt_paygt}=    Convert To Integer    ${camp_amt_paygt}
    Run Keyword If    ${Camp_val}!=${camp_amt_paygt}    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"    ELSE    Log To Console    ${camp_name} campaign amount is ${camp_amt_paygt}   

Convert to price
    [Arguments]    ${price_std}

    ${price_std}=    Remove String Using Regexp    ${price_std}    \\D        
    ${price_std}=    Convert To Integer    ${price_std}
    
    [Return]    ${price_std}

Why do you want to quit - PopUp
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[contains(text(),'Why do you want to quit?')]/preceding-sibling::span    
    Run Keyword If    'True'=='${status}'    Click Element    xpath=//p[contains(text(),'Why do you want to quit?')]/preceding-sibling::span

Checkout flow campaign - HIV
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep   5s
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_name}=    Get Substring    ${camp_name}    11    14
    ${label_val}=    Get Text    xpath=//label[contains(text(),'3 Months')]
    #${label_val}=    Get Text    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    ${Camp_amt}=    Get Substring    ${label_val}    9    16
    Log To Console    Final val is: ${camp_amt}
    Sleep    15s
    
    Wait Until Element Is Visible    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    15s    
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Sleep    10s    
    Click Element    id=ChkForSI
    
    Add to cart text change
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    

    Click Element    xpath=//a[@class='view_cart']
    
    # ${view_cart_amount}=    Get Text    xpath=//td[@class='views-field views-field-total-price__number views-align-center']
    # Log To Console    View cart page campaign amount: ${view_cart_amount}
    
    [Return]    ${camp_name}    ${camp_amt}
    
Proceed to autopay text change
    ${button_text}=    Get Text    xpath=//div[@class='SIPopBlock']/div[3]//button
    Run Keyword If    'PROCEED TO AUTOPAY'=='${button_text}'    Log To Console    "Button changed to PROCEED TO AUTOPAY"    ELSE    Fail    "Button was not changed to  PROCEED TO AUTOPAY"    
    
Add to cart functionality - Gift catalog
    
    Clear and input text - Gift catalog    ${lesser_amount}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/p)[1]
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert is displayed for amount: ${lesser_amount}"    ELSE    Fail    "Minimum donation amount alert was not displayed for amount: ${lesser_amount}"
    Add to cart button disable - Gift catalog
    Sleep    5s
    
    Clear and input text - Gift catalog    ${minimum_amount}
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/p)[1]
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert was not displayed for amount: ${minimum_amount}"    ELSE    Fail    "Minimum donation amount alert is displaying for amount: ${minimum_amount}"
    Add to cart button enabled - Gift catalog
    Sleep    5s    

    Clear and input text - Gift catalog    ${accurate_amount}
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/p)[1]
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert was not displayed for amount: ${accurate_amount}"    ELSE    Fail    "Minimum donation amount alert is displaying for amount: ${accurate_amount}"
    Add to cart button enabled - Gift catalog
    Sleep    5s        
    
    Clear and input text - Gift catalog    ${maximum_amount}        
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/p)[1]
    Run Keyword If    'True'=='${status}'    Log To Console    "Minimum donation amount alert was not displayed for amount: ${maximum_amount}    ELSE    Fail    "Minimum donation amount alert is displaying for amount: ${maximum_amount}"
    Add to cart button enabled - Gift catalog
    Sleep    5s
    
    Clear and input text - Gift catalog    ${higher_amount}
    ${max_value}=    Get Element Attribute    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/input)[1]    value
    Run Keyword If    '100000'=='${max_value}'    Log To Console    "Given amount '${higher_amount}' is changed to : ${max_value} in webpage"    ELSE    Fail    "Given amount is not changed to "₹100000"      
    Add to cart button enabled - Gift catalog
    Sleep    5s

Clear and input text - Gift catalog
    [Arguments]    ${text}
    Clear Element Text    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/input)[1]
    Input Text    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='realgift_input_value commerce_manual_inputs']/input)[1]    ${text}

Add to cart button disable - Gift catalog
    ${button_status}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='kl_flood_sub_or_sec']/input)[1]
    Run Keyword If    'True'=='${button_status}'    Log To Console    "Button is disabled"    ELSE    Fail    "Button was not disabled"
Add to cart button enabled - Gift catalog
    ${button_status}=    Run Keyword And Return Status    Element Should Be Enabled    xpath=(.//div[@class='gift-catelogue']/div[1]//following-sibling::article/div[@id='mySidenav']//div[@class='kl_flood_sub_or_sec']/input)[1]
    Run Keyword If    'True'=='${button_status}'    Log To Console    "Button is enabled"    ELSE    Fail    "Button was not enabled"

Mouse hover ways to give after login
    [Arguments]    ${submenu}
    
    Mouse Over    xpath=//li/span[contains(.,'Ways to Give')]
    Click Element    xpath=//li/a[contains(.,'${submenu}')]

Banner text check should not visible
    [Arguments]    ${content}
    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//div[@class='banner-content']/h2[contains(text(),'${content}')]
        Run Keyword If    '${status}'!='True'    Fail    Tax banner is Visible out of the month match and april    ELSE    Log To Console    Banner is not visible   
    END

Banner text check should be visible
    [Arguments]    ${content}
    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='banner-content']/h2[contains(text(),'${content}')]        
        Run Keyword If    '${status}'!='True'    Fail    Tax banner was not Visible    ELSE    Log To Console    Banner is visible   
    END
    
Payment failure check in home page banner - Click
    [Arguments]    ${content}
    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    ${banner_count}=    Convert To Integer    ${banner_count}    
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        Capture Page Screenshot
        ${status}=    Run Keyword And Return Status    Element Should Contain    xpath=//div[@class='banner-content']/a[contains(text(),'${content}')]    ${content}            
        Run Keyword If    '${status}'=='True'    Click Element    xpath=//div[@class='banner-content']/a[contains(text(),'${content}')]    
        Exit For Loop If    '${status}'=='True'
    END            
    Run Keyword If    '${status}'!='True'    Fail    Payment failure banner was not found

today date complete    
    ${today_date}=    Get Current Date    result_format=%Y-%m-%d
    ${today_date}=    Convert Date    ${today_date}    datetime

    [Return]    ${today_date}

get DOB from my profile
    ${dob}=    Get Text    xpath=//div[contains(@class,'date-of-birth')]/div[2]
    ${year}=    Get Substring    ${dob}    6    11        
    ${dob}=    Replace String    ${dob}    ${year}    2021    
    ${dob_coverted}=    Convert Date    ${dob}    date_format=%m/%d/%Y    result_format=%Y/%m/%d
    Log To Console    ${dob_coverted}    

    [Return]    ${dob_coverted}

no of days have calculation
    [Arguments]    ${dob_coverted}    ${today_date}
    
    ${numberofdays}=    Subtract Date From Date    ${dob_coverted}    ${today_date}    verbose
    ${days_have}=    Convert To String    ${numberofdays}
    ${days_have}=    Remove String Using Regexp    ${days_have}    \\D
    ${days_have}=    Convert To Integer    ${days_have}
    
    Log To Console    No of days ${days_have}        
    
    [Return]    ${days_have}

Banner check birthday
    [Arguments]    ${content}
    
    Click Element    xpath=//div[@class='header_new_logo']//a    
    Sleep    15s    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    ${banner_count}=    Convert To Integer    ${banner_count}    
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        Capture Page Screenshot
        ${status}=    Run Keyword And Return Status    Element Should Contain    xpath=//div[@class='banner-content']/a[contains(text(),'${content}')]    ${content}            
        Run Keyword If    '${status}'=='True'    Log To Console    Birthday banner is visible        
        Exit For Loop If    '${status}'=='True'
    END            
    Run Keyword If    '${status}'!='True'    Fail    Birthday banner was not visible

Banner check birthday - should not visible
    [Arguments]    ${content}
    
    Click Element    xpath=//div[@class='header_new_logo']//a    
    Sleep    15s    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    ${banner_count}=    Convert To Integer    ${banner_count}    
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        Capture Page Screenshot
        ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//div[@class='banner-content']/a[contains(text(),'${content}')]
        Run Keyword If    '${status}'=='True'    Log To Console    Birthday banner is not visible        
        Exit For Loop If    '${status}'=='True'
    END            
    Run Keyword If    '${status}'!='True'    Fail    Birthday banner is visible

Password matching check
    
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    ${pass1}
    
    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[@for='edit-pass-pass2']    
    Input Text    id=edit-pass-pass2    ${pass1}

    Sleep    3s         
             
    ${password}=    Get Element Attribute    xpath=//div[contains(@class,'password-confirm')]/span    class
    Run Keyword If    '${password}'!='ok'    Fail    Password doesnt match icon visible    ELSE    Log To Console    Password is matching icon visible


Password doesnt matching check
    
    Clear Element Text    id=edit-pass-pass1
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    ${pass1}
    
    Clear Element Text    id=edit-pass-pass2
    Click Element    //label[@for='edit-pass-pass2']    
    Input Text    id=edit-pass-pass2    ${pass2}
    
    Sleep    3s        
    
    ${password}=    Get Element Attribute    xpath=//div[contains(@class,'password-confirm')]/span    class
    Run Keyword If    '${password}'!='error'    Fail    Password is matching icon visible    ELSE    Log To Console    Password doesnt match icon visible

HDFC payment failure flow
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//input[contains(@id,'edit-payment-information-payment-method')]/following-sibling::span[contains(text(),'${checkout_payment_list_text}[2]')]
    Run Keyword If    '${status}'=='True'    Click Element    xpath=//span[contains(text(),'POWERED BY HDFC BANK')]//preceding-sibling::input    ELSE    Log    POWERED BY HDFC BANK is not dispalyed
    Sleep    20s    
    Click Element    xpath=//div[@id='edit-actions']/button[contains(text(),'pay my contribution')]
    
    Wait Until Element Is Visible    xpath=//li[contains(text(),'Pay with')]    30s    
    Click Element    xpath=//li[contains(text(),'Pay with')]    
    Sleep    5s        
    Mouse Over    id=hdfc_credit
    Click Element    id=hdfc_credit
    Sleep    5s      
    Click Element    id=cancel_btn

Axis payment failure flow
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//input[contains(@id,'edit-payment-information-payment-method')]/following-sibling::span[contains(text(),'${checkout_payment_list_text}[1]')]
    Run Keyword If    '${status}'=='True'    Click Element    xpath=//span[contains(text(),'Powered by AXIS BANK')]//preceding-sibling::input    ELSE    Log    POWERED BY HDFC BANK is not dispalyed
    Sleep    20s        
    Click Element    xpath=//div[@id='edit-actions']/button[contains(text(),'pay my contribution')]               
    Element Should Be Visible    id=btnCancel    30s
    Click Element    id=btnCancel     
    Alert Should Be Present    action=ACCEPT    timeout=30s

Welcome user banner text
    [Arguments]    ${content}
    
    Click Element    xpath=//div[@class='header_new_logo']//a    
    Sleep    15s    
    ${banner_count}=    Get Element Count    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide')]
    ${banner_count}=    Convert To Integer    ${banner_count}    
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[@class='swiper-wrapper']/following-sibling::div//span[contains(@aria-label,'Go to slide ${element}')]
        Capture Page Screenshot
        ${status}=    Run Keyword And Return Status    Element Should Contain    xpath=//div[@class='banner-content']/h2[contains(text(),'${content}')]    ${content}            
        Run Keyword If    '${status}'=='True'    Log To Console    Welcome user banner is visible        
        Exit For Loop If    '${status}'=='True'
    END            
    Run Keyword If    '${status}'!='True'    Fail    Welcome user banner was not visible

Other Passport Flow
    Click Element    xpath=.//div[@class='item-image']//img
    Sleep    5s    
    ${camp_name}=    Get Text    xpath=//div[@class='inner_banner_pledge_content']/h2/div/p
    ${label_val}=    Get Text    xpath=//label[contains(text(),'3 Months')]     
    ${Camp_amt}=    Get Substring    ${label_val}    9    16
    Log    Campaign val is: ${camp_amt}
    SI Payment disable check
    
    Wait Until Element Is Visible    xpath=//label[contains(text(),'3 Months')]    30s    
    Click Element    xpath=//label[contains(text(),'3 Months')]
    Sleep    10s    
    
    Add to cart text change
    Click Add To Cart
    Success text in shadow window
    Click Proceed To Checkout Button
    
    [Return]    ${camp_name}    ${camp_amt}

SI Payment disable check    
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    id=ChkForSI
    Run Keyword If    '${status}'!='True'    Fail    SI Payment is enabled for Other passport user    ELSE    Log    SI Payment is disabled for Other Passport Users

Hdfc bank payment gateway check
    Sleep   10s
    ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'POWERED BY HDFC BANK')]
    Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    HDFC payment gateway doesnt appear    ELSE    Log To Console    HDFC payment gateway is visible

Nationality Check        
    ${Nationality}=    Get text    xpath=//div[contains(text(),'Nationality')]/following-sibling::div
    Run Keyword If    'Other Passport Holder'!='${Nationality}'    Fail    "User is a: ${Nationality}"

SI payment gateway check
    Sleep    15s    
    ${price_SI}=    Get Text    id=TotalAmtOfOrder
    ${price_SI}=    Convert to price    ${price_SI}
    Log To Console    campaign amount is: ${price_SI}         
    FOR    ${element}    IN    @{SI_payment_list_text}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='payment-main-content']/div[contains(text(),'${element}')]
        Run Keyword If    '${status}'!='True'    Fail    '${element} was not displayed"    ELSE    Log To Console    "${element} is displayed"    
    END
    
View Myprofile    
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=//ul[@class='mypro-lgot']/li/a[contains(.,'My Profile')]
    
Nationality Check - Indian        
    ${Nationality}=    Get text    xpath=//div[contains(text(),'Nationality')]/following-sibling::div
    Run Keyword If    'Indian Citizen'!='${Nationality}'    Fail    "User is a: ${Nationality}"    

Indian payment gateway check - payment gateway
    Sleep    5s   
    Wait Until Element Is Visible    xpath=//h3[text()='Suggested Payment Gateway']    60s 
    FOR    ${checkout_bank_txt}    IN    @{checkout_payment_list_ind_passport}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//input[contains(@id,'edit-payment-information-payment-method')]/following-sibling::label[contains(.,'${checkout_bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Indian passport holder Payment Gateway ${checkout_bank_txt} text is mismatch'
    END

Main and submenu selection
    [Arguments]    ${main_menu}    ${sub_menu}
    
    Mouse Over    xpath=//div[@class='main-menu-inner']//span[contains(text(),'${main_menu}')]
    Click Element    xpath=//div[@class='main-menu-inner']//span[contains(text(),'${main_menu}')]//parent::li//li/a[contains(text(),'${sub_menu}')]

Click mainmenu
    [Arguments]    ${main_menu}
    
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'${main_menu}')]

Click Login    
    Click Element    xpath=//a[contains(text(),'Login')]

Click Cart
    Click Element    xpath=.//a[contains(.,'My Gifts')]

Click my next payment
    Click Element    xpath=//li[@class='post_lgn']/a        

Mycampaign Check
    [Arguments]    ${camp_name}
    
    Sleep    10s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='user_campheading']//a[contains(text(),'${camp_name}')]        
    Run Keyword If    '${status}'!='True'    Fail    Campaign is not added in my campaign page    ELSE    LOG    Campaign is added in my campaign page

Logout    
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'Logout')]
    
one time campaign - Hunger Free campaign - Multiple payment
    [Arguments]    ${campaign_amount}
    
    Sleep    10s
    Click Element    xpath=.//div[@class='add-to-cart-section']
    ${camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${camp_name}=    Remove String    ${camp_name}    Free    
    
    Clear Element Text    xpath=//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']
    Input Text    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input']    ${campaign_amount}    
    Sleep    5s    
    
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
        
    Click Element    xpath=//a[@class='view_cart']
    
    ${camp_val_1st}=    Get Substring    ${campaign_amount}    0    1   
    ${camp_val_2st}=    Get Substring    ${campaign_amount}    1    5
    Log To Console    ${camp_val_1st}    ${camp_val_2st}
    ${camp_val}=    Evaluate    '${camp_val_1st}'+','+'${camp_val_2st}'
    #Log To Console    ${camp_val}         
    
    [Return]    ${camp_name}    ${camp_val}    

I Pledge to Support Click
    Sleep    5s    
    Click Element    xpath=.//div[@class='item-image']//img

SI login - Other Passport
    Wait Until Element Is Visible    xpath=//input[contains(@id,'exampleInputEmail')]    30s
    Click Element    xpath=//input[contains(@id,'exampleInputEmail')]    
    Input Text    xpath=//input[contains(@id,'exampleInputEmail')]    ${OtherPassportUser}
    Click Element    xpath=//input[contains(@id,'exampleInputPassword')]
    Input Text    xpath=//input[contains(@id,'exampleInputPassword')]    ${OtherPassportPass}
    
    Sleep    10s    
    Click Element    id=si_login_btn
    
SI Other Passport Disabled Alert
    Sleep    10s    
    ${OtherPassSIAlert}=    Get Text    xpath=//div[@class='otherHolderFlow']/div
    Run Keyword If    '${SIOtherPassMessage}'=='${OtherPassSIAlert}'    SI Other Passport alert button click    ELSE    Fail    SI payment restriction alert for Other passport user is not displayed    
                
SI Other Passport alert button click
    Sleep    3s    
    Click Element    class=otherHolderBtn

Page Title Check and confirm
    [Arguments]    ${element}
    
    ${pageTitle}=    Get Title    
    Should Contain    ${pageTitle}    ${element} 
    
Gift Cart Click
    Sleep    2s    
    Click Element    xpath=.//a[contains(.,'My Gifts')]
    
Rotator Allow Auto Debit status check
    Sleep    2s    
    ${status}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//label[@class='chkSIpatent']/input    checked
    Run Keyword If    '${status}'!='true'    Fail    Auto payment is not checked    ELSE    Log    Auto payment is checked        
    
Rotator Proceed To Autopay
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//button[contains(text(),' PROCEED TO AUTOPAY ')]    

Why do you want to leave - PopUp
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[@class='close-survey2']    
    Run Keyword If    'True'=='${status}'    Click Element    xpath=//span[@class='close-survey2']
    
My Next Payment
    Click Element    xpath=.//li[@class='post_lgn']/a
    
My Next Payment Gift Menu and My Child Menu Check
    
    Sleep    5s    
    ${status}=    Get Element Attribute    xpath=//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]    class
    Run Keyword If    '${status}'!='active'    Fail    Donation was not selected by default    ELSE    Log    Donation was selected by default    
    
    ${status}=    Get Element Attribute    id=childsec-shwhde    class
    #${status}=    Get Element Attribute    xpath=//div[@id='donation']//a[contains(text(),'My Child') or contains(text(),'My Children')]    class
    Run Keyword If    '${status}'!='tog-active'    Fail    My Child was not selected by default    ELSE    Log    My Child was selected by default 

My Next Payment Gift Menu Check and Select Submenu
    [Arguments]    ${SubMenu}
    
    Sleep    5s    
    ${status}=    Get Element Attribute    xpath=//ul[@class='nav nav-tabs gift-donation']/li[contains(.,'Donation')]    class
    Run Keyword If    '${status}'!='active'    Fail    Donation was not selected by default    ELSE    Log    Donation was selected by default    
    Click Element    xpath=//div[@id='donation']//a[contains(text(),'${SubMenu}')]
    
Banner Alert Capture       
    Wait Until Element Is Visible    xpath=(//h6[text()='Share the Joy'])[1]    60s
    ${banner_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//h6[text()='Share the Joy'])[1]
    Run Keyword If    'True'=='${banner_status}'    Log    Share the joy Dialog Box Displayed     ELSE    Log To Console    Share the joy Dialog Box is not Displayed    

Why do you want to leave alert button check    
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Do you want to leave without gifting?')]    60s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[contains(text(),'Do you want to leave without gifting?')]    
    Run Keyword If    'True'=='${status}'    Log To Console    Why do you want to leave dialog box appeared    ELSE    Fail    Why do you want to leave dialog box doesn't appear
    
    FOR    ${element}    IN    @{whyDoYouWantToLeave}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[contains(@class,'modal-content-survey')])[2]/div//span[contains(text(),'${element}')]        
        Run Keyword If    '${status}'!='True'    Fail    ${element}: Button is not visible    ELSE    Log    ${element}: Button is visible
    END

CCavenue payment flow
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Sleep    30s
    Click Element    //button[text()='pay my contribution']        
    Wait Until Element Is Visible    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]    15s    
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Click Element    xpath=.//input[@type='submit']

Share the Joy Alert Capture
    Wait Until Element Is Visible    xpath=(//h6[text()='Share the Joy'])[1]    60s
    ${banner_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//h6[text()='Share the Joy'])[1]
    Run Keyword If    'True'=='${banner_status}'    Log    Share the joy Dialog Box Displayed     ELSE    Log To Console    Share the joy Dialog Box is not Displayed
    
Share The Joy Email Section
    Click Element    xpath=(//a[text()='Email'])[1]
    Input Text    class=refer_share_email    test@test.com
    Input Text    class=refer_share_phone    password
    Element Should Be Visible    class=wv_refer_email_content    60s
    Click Element    class=wv_refer_email_btn     

Share The Joy Copy URL Section
    Click Element    xpath=(//a[text()='Copy URL'])[1]    
    Click Element    Class=cpyButton
    Sleep    5s    
    Element Should Be Visible    id=copiedURL    60s 
    
People have Also Donated for Content Check
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//h3[contains(text(),'People have Also Donated for')]    
    Run Keyword If    '${status}'!='True'    Fail    "People have also donated for" message is not visible    ELSE    Log    "People have also donated for" message is visible

    FOR    ${element}    IN    @{peopleHaveDonateButton}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//a[@href='${element}']    
        Run Keyword If    '${status}'!='True'    Fail    Button is not visible    ELSE    Log    Button is visible    
    END
    
Share The Joy Social Media Section
    Click Element    Xpath=(//a[text()='Social Media'])[1]    
    
    FOR    ${element}    IN    @{SocialMedia}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//span[contains(@class,'${element}')])[1]    
        Run Keyword If    '${status}'!='True'    Fail    Button is not visible    ELSE    Log    Button is visible
    END
    
Click Register
    Click Element    xpath=//a[contains(text(),'Register')]

Select Title
    [Arguments]    ${Title}
    
    Select From List By Label    id=edit-field-title    ${Title}
    
Enter First Name
    [Arguments]    ${FirstName}    

    Input Text    id=edit-field-first-name-0-value    ${FirstName}

Enter Last Name
    [Arguments]    ${LastName}    

    Input Text    id=edit-field-last-name-0-value    ${LastName}

Enter Email ID
    [Arguments]    ${Email}

    Input Text    id=edit-mail    ${Email}
    
Enter Phone Number
    [Arguments]    ${Phone}
    
    Input Text    id=edit-field-mobile-verify-0-mobile    ${Phone}

Enter Password
    [Arguments]    ${InputPassword}
    
    Wait Until Element Is Visible    id=edit-pass-pass1    20s
    Click Element    //label[@for='edit-pass-pass1']    
    Input Text    id=edit-pass-pass1    ${InputPassword}

Enter Confirm Password
    [Arguments]    ${ConfirmPassword}

    Wait Until Element Is Visible    id=edit-pass-pass2    20s
    Click Element    //label[@for='edit-pass-pass2']
    Input Text    id=edit-pass-pass2    ${ConfirmPassword}

Enter Address Field I
    [Arguments]    ${AddressI}
    
    Input Text    id=edit-field-registeraddress-0-value    ${AddressI}

Click Create My Account    
    Click Element    class=singUpRegister    

Element Status Check
    [Arguments]    ${element}    ${alert_Positive_msg}    ${alert_Negative_msg}
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${element}
    Run Keyword If    '${status}'=='True'    Log    ${alert_Positive_msg}    ELSE    Fail    ${alert_Negative_msg}
    
BySpecific location click
    [Arguments]    ${location}
    
    Sleep    5s    
    Click Element    xpath=//span[@class='facet-item__value' and contains(text(),'${location}')]
    
Click Above 12 years
    Sleep    5s    
    Click Element    xpath=//label[@for='age-range-above-12-years']
    
Click Below 12 years
    Sleep    5s    
    Click Element    xpath=//label[@for='age-range-6-12-years']    

Click Age Filter
    [Arguments]    ${age}
    
    Sleep    5s    
    Run Keyword If    ${age}<12    Click Below 12 years    ELSE    Click Above 12 years    
    
Click Gender Boy    
    
    Sleep    5s    
    Click Element    xpath=//label[@for='gender-boy']
    
Click Gender Girl    
    
    Sleep    5s    
    Click Element    xpath=//label[@for='gender-girl']
    
Get Child Details BySpecific Page
    
    ${ChildName}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[1]  
    ${ChildDOB}=    Get Text    xpath=(//div[@class='bySpecName'])[1]/p[2]
    ${day}=    Get Substring    ${ChildDOB}    8   10
    ${day}=    Convert To Integer    ${day}    
    ${month}=    Get Substring    ${ChildDOB}    5    7    
    ${month}=    Convert To Integer    ${month}
    ${year}=    Get Substring    ${ChildDOB}    0    4
    ${year}=    Convert To Integer    ${year}
    Scroll Element Into View    xpath=//span[text()='Gender']
    ${ChildAge}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]//span[@class='bySpecage']
    ${ChildGender}=    Get Text    xpath=(//div[@class='bySpecinfo'])[1]//span[@class='bySpecGender']
    ${Location}=    Get Text    xpath=//div[@class='bySpecLocation']/p
    ${status}=    Remove String Using Regexp    ${Location}    \\W*\\d*
    ${UpdatedLocation}=    Get Substring    ${Location}    0    5
    
    [Return]    ${ChildAge}    ${day}    ${month}    ${year}    ${UpdatedLocation}    ${childGender}
    
Click Gender in BySpecific Page
    [Arguments]    ${gender}
        
    Run Keyword If    '${gender}'=='boy'    Click Gender Boy    ELSE    Click Gender Girl   

Click Month Filter in BySpecific Page
    [Arguments]    ${month}
    
    Sleep   5s    
    Scroll Element Into View    xpath=//span[@class='reset-facets']
    #${month}=    Evaluate    ${month}+1
    ${TextMonth}=    Get From List    ${Months}    ${month}      
    Click Element    id=monthOnly
    Click Element    xpath=//span[@class='month' and contains(text(),'${TextMonth}')]  
    
Select Date in BySpecific Page
    [Arguments]    ${day}
    
    Click Element    id=dateonly    
    Click Element    xpath=//td[@data-handler='selectDay' and contains(text(),'${day}')]    

Main Menu Search Button Click
    Sleep    5s    
    Click Element    xpath=//li[@class='separate_border header_search'] 
    
Input Data Into Search Box
    [Arguments]    ${data}
    
    Wait Until Element Is Visible    id=edit-search-api-fulltext      60s
    Input Text    id=edit-search-api-fulltext    ${data}

Search Page Child List    
    ${ElementCount}=    Get Element Count    xpath=//div[@class='search-page-childimg test']
    Should Be Equal As Integers    4    ${ElementCount}    

Click Add to Cart in Search Page
    ${childName}=    Get Text    xpath=(//div[@class='search-page-childimg test'])[1]/h4
    Mouse Over    class=search-page    
    Click Element    xpath=(//div[@class='add-cart-btn'])[1]    

    [Return]    ${childName}
    
Click 3Month package
    ${Camp_Amount}=    Get Text    xpath=//label[contains(text(),'3 Months')]
    ${final_val}=    Get Substring    ${Camp_Amount}    9    16
    Click Element    xpath=//label[contains(text(),'3 Months')]   
     
    [Return]    ${final_val}
SI Payment Check Verify
    Sleep    5s    
    ${status}=    Get Element Attribute    id=ChkForSI    checked
    Run Keyword If    '${status}'!='true'    Fail    SI Payment is unchecked    ELSE    Log    SI Payment is checked
    
SI Payment Uncheck Verify
    Sleep    5s    
    ${status}=    Get Element Attribute    id=ChkForSI    checked
    Run Keyword If    '${status}'!='false'    Fail    SI Payment is checked    ELSE    Log    SI Payment is not checked

Proceed to Pay Button
    Click Element    xpath=(//button[contains(@class,'si_modal_btn')])[1]            
    
Click SI CheckBox
    Click Element    id=ChkForSI    

Click Add To Cart
    Click Element    xpath=(//div[@class='kl_flood_sub_or_sec'])[1]  

Checkout flow campaign - search and donate
    ${label_val}=    Get Text    xpath=//label[contains(text(),'3 Months')]    
    ${Price}=    Get Substring    ${label_val}    9    16
    ${Int_Price}=    Convert to price    ${Price}
    ${camp_amt}=      Format String     {:,}    ${Int_Price}
    Log To Console    Final val is: ${camp_amt}
    Sleep    10s
    
    Wait Until Element Is Visible    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label    15s    
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Sleep    10s    
    Click Element    xpath=(//input[@id='ChkForSI'])[1]
    Sleep    2s
    #SI Payment Uncheck Verify
    Click Element    xpath=(//div[@class='kl_flood_sub_or_sec'])[1]    
    ${success_mgs}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"    
    Click Element    xpath=//a[@class='view_cart']
    
    [Return]    ${camp_amt}
    
Mouse Hover main menu and click submenu
    [Arguments]    ${mainmenu}    ${submenu}
    
    Mouse Over    xpath=//div[@class='main-menu-inner']//*[contains(text(),'${mainmenu}')]
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'${submenu}')]    

Identify Status Code
    [Arguments]    ${element_To_Check}
    
    Create Session    WorldVision    ${baseurl}
    ${response}=    Get On Session    WorldVision    ${element_To_Check}
    ${statusCode}=    Convert To String    ${response.status_code}
    Should Be Equal    ${statusCode}    200
    
Home Page Banner Image 
    #[Arguments]    ${homepage_banner}
         
    ${banner_count}=    Get Element Count    xpath=//div[@class='tp-bgimg defaultimg']
    ${banner_count}=    Convert To Integer    ${banner_count}
        
    FOR    ${element}    IN RANGE    1    ${banner_count}+1
        Click Element    xpath=//div[contains(@class,'tp-bullet')]/div[contains(@class,'tp-bullet')][${element}]
        Capture Page Screenshot
        ${element}=    Get Element Attribute    xpath=(//div[@class='tp-bgimg defaultimg'])[${element}]    src
        ${BannerImage}=    Remove String    ${element}    https://uat.worldvision.in/
        Identify Status Code    ${BannerImage}
    END

Click ResetAll BySpecific page
    Sleep    5s    
    Click Element    xpath=//span[@class='reset-facets']

Click Around You BySpecific page
    Click Element    xpath=//li[contains(@class,'around-you')]
    
Click By Name BySpecific page
    Click Element    xpath=//li[contains(@class,'by-name')]
    
Click MostNeed BySpecific page
    Click Element    xpath=//li[contains(@class,'most-needed')]
    
Child Name Verify BySpecific page
    [Arguments]    ${Child_name}
    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='overall_banner_pledge'][1]/div[2]/h2[contains(text(),'${Child_name}')]
    Run Keyword If    'True'=='${status}'    Log To Console    "Child found in popup menus"    ELSE    Fail    "Child is mismatching in popup menu"
    
9600 Amount Button Verify BySpecific page
    ##Current in xpath means checked##
    ${ActiveStatus}=    Get Element Attribute    xpath=(//label[@for='9600'])[1]/parent::div    class
    Should Contain    ${ActiveStatus}    current
    
SI Checkbox verify BySpecific page
    ${recurring_payments}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=(//input[@id='ChkForSI'])[1]
    Run Keyword If    'True'=='${recurring_payments}'    Log To Console    "Please use my card details for recurring payments is selected by default"    ELSE    Fail    "Please use my card details for recurring payments is not selected by default"
    
Child Quantity verify BySpecific page
    ${more_childrens}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '0'=='${more_childrens}'    Log To Console    "Sponsor More Children is 0 by default "    ELSE    Fail    "Sponsor More Children is not 0 by default"
    
Success text in shadow window
    ${child_sponsor_msg}=    Get Text    xpath=//h2[@class='chat-text']
    Run Keyword If    '${child_sponsor_msg}'!='Success !'    Fail    "After child selected 'Sponsor Successfull' text not display"

Rotator Proceed To Autopay Text Check
    ${status}=    Run Keyword And Return Status    Element Should Contain    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//button[contains(@class,'si_modal_btn')]    PROCEED TO AUTOPAY
    Run Keyword If    '${status}'!='True'    Fail    Button Text is not displayed as Proceed To Autopay

Rotator Add to Cart Button Text Check
    ${status}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[contains(@id,'edit-submit')]    value
    Run Keyword If    '${status}'!='SPONSOR NOW'    Fail    Button Text is not changed to Add to Cart

Rotator SI checkbox Click
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//label[@class='chkSIlabel']

Rotator Child Count
    ${get_child_count}=    Get Element Count    xpath=//*[@class='child_sponsor_image']/img
    Run Keyword If    ${get_child_count}<5    Fail    In home page child rotator child are display lessthen 5

Child Rotator Status
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    id=myCarousel
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer child rotator section not displayed"

Child Quantity verify BySpecific page
    [Arguments]    ${NoOfChild}
    
    ${more_childrens}=    Get Element Attribute    xpath=(//input[@id='SIPopBlock_qty'])[1]    value
    Run Keyword If    '${NoOfChild}'=='${more_childrens}'    Log    "Sponsor More Children is ${NoOfChild}"    ELSE    Fail    "Sponsor More Children is not ${NoOfChild}"

No of Child Addition in BySpecific page
    [Arguments]    ${NoOfChild}
    
    FOR    ${element}    IN RANGE    1    ${NoOfChild}
        Click Element    xpath=(//div[@id='sip_increase'])[1]    
    END

My Next Payment MainMenu and SubMenu
    [Arguments]    ${mainMenu}    ${subMenu}

    Click Element    xpath=//a[text()='${mainMenu}']    
    Click Element    xpath=//a[text()='${subMenu}'] 
    
My Next Payment campaign Check
    [Arguments]    ${campaign}
  
    Element Status Check    xpath=//div[@class='cld-nme']//p[contains(text(),'${campaign}')]    ${campaign} is added to My Campaign bucket    ${campaign} was not added to My Campaign bucket

My Next Payment Proceed Button
    Click Element    class=pymnt-smt-sec 
    
My Next Payment SI Checkbox Enabled Verify
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=si_checkbox
    Run Keyword If    '${status}'!='True'    Fail    SI Payment is disabled in My Next Payment Page     ELSE    Log    SI Payment is enabled in My Next Payment Page    

My Next Payment SI Checkbox Disabled Verify
    Sleep    5s    
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    id=si_checkbox
    Run Keyword If    '${status}'!='True'    Fail    SI Payment is enable in My Next Payment Page     ELSE    Log    SI Payment is disabled in My Next Payment Page

Get CSS Attribute Value
    [Arguments]    ${locator}    ${attribute}
    
    # Get element using Xpath in JavaScript.
    # Note there are other options like getElementById/Class/Tag
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('${attribute}');
    Log   ${attribute_value}
    
    [Return]    ${attribute_value}
    
check in view cart page - Checkout flow to sponsor a child
    [Arguments]    ${camp_name}    ${camp_amt}

    Sleep    10s    
        
    ${camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]
    Run Keyword If    'True'!='${camp_viewcart}'    Fail    "${camp_name} campaign not display in view cart page"
    
    ${camp_amt_viewcart}=    Get Text    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]/following-sibling::td[3]
    ${cart_amt}=    Convert to price    ${camp_amt_viewcart}
    Run Keyword If    ${camp_amt}!=${cart_amt}    Fail    "${camp_name} campaign amount are not display or mismatch in view cart page"    
    
    ${cart_quanity}=    Get Element Attribute    xpath=//span[@class='dynamic-quantity']//input    value
    
    [Return]    ${cart_quanity}
    
CCavenue payment - cart verification sponsor a child
    [Arguments]    ${camp_name}    ${Camp_val}    ${cart_quanity}
    
    Sleep    20s    
    Banner Alert
    ${order_status}=    Get Text   xpath=//div[@class='payment-success-message1']/p
    Log To Console    ${order_status}
        
    ${count}=    Get Element Count    xpath=//td[contains(@class,'views-field-product-id')]
    FOR    ${element}    IN RANGE    1    ${count}+1
        ${status_campaign}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_name}')]
        Run Keyword If    'True'=='${status_campaign}'    Log To Console    "${camp_name}" is displayed in payment page    ELSE    Fail    "${camp_name} was not displayed in payment page"
        
        ${campaign_quanity}=    Get Text    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[2]//span
        Run Keyword If    '${cart_quanity}'=='${campaign_quanity}'    Log To Console    campaign quantity is: ${campaign_quanity}    ELSE    Fail    campaign quantity was not displayed
        
        ${camp_amt_viewcart}=    Get Text    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${camp_name}')]/following-sibling::td[3]
        ${cart_amt}=    Convert to price    ${camp_amt_viewcart}
        Run Keyword If    ${cart_amt}==${Camp_val}    Log To Console    "${camp_val} campaign value is displayed in payment page"    ELSE    Fail    "${camp_val} campaign value was not displayed in payment page"    

        # ${status_price}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[contains(text(),'${camp_name}')]/following-sibling::td[3][contains(text(),'${camp_val}')]
        # Run Keyword If    'True'=='${status_price}'    Log To Console    "${camp_val} campaign value is displayed in payment page"    ELSE    Fail    "${camp_val} campaign value was not displayed in payment page"    
    END    
    
BySpecific Selected By Default
    ${by_specific}=    Get Element Attribute    xpath=//a[text()='By specifics']/parent::span    class   
    Run Keyword If    '${by_specific}'=='checkmark checked'    Log    "By specific is selected by default"    ELSE    Fail    "By specific was not selected by default"
    
Most Needed Child Selected By Default
    ${most_needed}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='gbl_tabbed_menu']//li[contains(@class,'most-needed active')]
    Run Keyword If    '${most_needed}'=='True'    Log    "Most Needed is selected by default"    ELSE    Fail    "Most Needed was not selected by default"    

Click SI CheckBox BySpecific Page
    Click Element    xpath=(//input[@id='ChkForSI'])[1]
    
Click Add to Cart BySpecific Page
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']/input     

Click Proceed To Checkout Button
    Click Element    class=view_cart

My Donation Bucket Uncheck
    My Next Payment MainMenu and SubMenu    Donation    My Donations
    Footer Cart Amout Hidder click
    ${childCount}=    Get Element Count    xpath=//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')]
    FOR    ${element}    IN RANGE    1    ${childCount}+1
        ${classValue}=    Get Element Attribute    xpath=(//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')])[${element}]    class
        ${status}=    Run Keyword And Return Status    Should Contain    ${classValue}    itm-sltn-add
        Scroll Element Into View    xpath=(//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')])[${element}]//div[@class='cld-nme']
        Run Keyword If    '${status}'=='True'    Click Element    xpath=(//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')])[${element}]//div[@class='cld-nme']    ELSE    Log    Item is not selected            
    END

My Children Bucket Uncheck
    My Next Payment MainMenu and SubMenu    Donation    My Children    
    ${childCount}=    Get Element Count    xpath=//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')]
    FOR    ${element}    IN RANGE    1    ${childCount}+1
        ${classValue}=    Get Element Attribute    xpath=(//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')])[${element}]    class
        ${status}=    Run Keyword And Return Status    Should Contain    ${classValue}    itm-sltn-add
        Scroll Element Into View    xpath=(//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')])[${element}]//div[@class='cld-nme']
        Run Keyword If    '${status}'=='True'    Click Donated SI Child    ${element}    ELSE    Log    Item is not selected    
    END

My Campaign Bucket Uncheck
    My Next Payment MainMenu and SubMenu    Donation    My Campaigns    
    ${childCount}=    Get Element Count    xpath=//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')]
    FOR    ${element}    IN RANGE    1    ${childCount}+1
        ${classValue}=    Get Element Attribute    xpath=(//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')])[${element}]    class
        ${status}=    Run Keyword And Return Status    Should Contain    ${classValue}    itm-sltn-add
        Scroll Element Into View    xpath=(//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')])[${element}]//div[@class='cld-nme']
        Run Keyword If    '${status}'=='True'    Click Donated Campaign in Normal Payment    ${element}    ELSE    Log    Item is not selected            
    END

Select Child Paid As SI in My Next Payment Page
    ${childCount}=    Get Element Count    xpath=//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')]
    FOR    ${element}    IN RANGE   1    ${childCount}+1
        ${after_content}=    Get Pseudo Element CSS Attribute Value    (//div[contains(@class,'mychildren-section')]//div[@class='cld-nme']//p[contains(text(),'')]/parent::div/parent::div)[${element}]    pseudo_element=':after'   attribute=content
        ${status}=    Run Keyword And Return Status    Should Contain    ${after_content}    Paid as SI
        Run Keyword If    '${status}'!='True'    Continue For Loop    ELSE    Click Donated SI Child    ${element}
        Exit For Loop If    '${status}'=='True'
    END
    Run Keyword If    '${status}'!='True'    Fail    Currently there is are no child donated with SI Payment
    ${childName}=    Get Text    xpath=(//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')])[${element}]//div[@class='cld-nme']/p

    [Return]    ${childName}

Select campaign Not Paid As SI in My Next Payment Page
    ${campaignCount}=    Get Element Count    xpath=//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')]
    FOR    ${element}    IN RANGE   1    ${campaignCount}+1
        ${after_content}=    Get Pseudo Element CSS Attribute Value    (//div[contains(@class,'mycampine-section')]//div[@class='cld-nme']//p[contains(text(),'')]/parent::div/parent::div)[${element}]    pseudo_element=':after'   attribute=content
        ${status}=    Run Keyword And Return Status    Should Not Contain    ${after_content}    Paid as SI
        Run Keyword If    '${status}'!='True'    Continue For Loop    ELSE    Click Donated Campaign in Normal Payment    ${element}
        Exit For Loop If    '${status}'=='True'
    END
    Run Keyword If    '${status}'!='True'    Fail    Currently there is are no campaign donated with normal Payment
    ${campaignName}=    Get Text    xpath=(//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')])[${element}]//div[@class='cld-nme']/p
    
    [Return]    ${campaignName}
    
Shadown Cart Total Amount
    [Arguments]    ${totalCartAmount}

    Element Status Check    xpath=//p[@class='cld-amount-pyble']/span[contains(text(),'${totalCartAmount}')]    Total Cart amount is matching    Total Cart amount doesnt match

Shadown Window Product verify
    [Arguments]    ${element}

    Element Status Check    xpath=//p[@class='si_title' and contains(text(),'${element}')]    ${element} is visible in Shadow Window    ${element} is not visible in Shadow Window    

My Next Payment Allow To Auto Debit click
    Click Element    id=si_checkbox  
    
Footer Cart Amout Hidder click
    Click Element    xpath=//div[@class='fixed-footerHider']/a    
    
Return One Year
    ${var}=    Set Variable    1 Year
    
    [Return]    ${var}
    
Return 6 Months
    ${var}=    Set Variable    6 Month
    
    [Return]    ${var}

Return 3 Months
    ${var}=    Set Variable    3 Month
    
    [Return]    ${var}
    
Return 1 Month
    ${var}=    Set Variable    1 Month
    
    [Return]    ${var}

Payment Frequency Convertion
    [Arguments]    ${paymentFrequency}
    
    ${ReturnValue}=        Run Keyword If    '${paymentFrequency}'=='Annually'    Return One Year
    ...    ELSE IF    '${paymentFrequency}'=='Half Yearly'    Return 6 Months
    ...    ELSE IF    '${paymentFrequency}'=='Quarterly'    Return 3 Months
    ...    ELSE    Return 1 Month
    Log To Console    Result: ${ReturnValue} 
    
    [Return]    ${ReturnValue}

Get Payment Frequency
    [Arguments]    ${productInCart}
    
    ${paymentFrequency}=    Get Text    xpath=//p[@class='si_title' and contains(text(),'${productInCart}')]/parent::div/parent::div/following-sibling::div/p

    [Return]    ${paymentFrequency}

My Next Payment SI Proceed To Autopay
    
    Click Element    id=SI_Make_payment_add_to_cart_btn     

Select One Time Donation in My Next Payment Page
    ${campaignCount}=    Get Element Count    xpath=//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')]
    FOR    ${element}    IN RANGE   1    ${campaignCount}+1
        ${after_content}=    Get Pseudo Element CSS Attribute Value    (//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[@class='cld-nme']//p[contains(text(),'')]/parent::div/parent::div)[${element}]    pseudo_element=':after'   attribute=content
        ${status}=    Run Keyword And Return Status    Should Not Contain    ${after_content}    Paid as SI
        Run Keyword If    '${status}'!='True'    Continue For Loop    ELSE    Click OneTimeDonated Campaign    ${element}
        Exit For Loop If    '${status}'=='True'
    END
    Run Keyword If    '${status}'!='True'    Fail    Currently there is are no campaign donated with normal Payment
    ${campaignName}=    Get Text    xpath=(//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')])[${element}]//div[@class='cld-nme']/p
    
    [Return]    ${campaignName}
    
Shadown Window OTD Product verify
    [Arguments]    ${element}

    Element Status Check    xpath=//div[@id='sideopenbar']//div[@class='cld-nme']/p[contains(text(),'${element}')]    ${element} is visible in Shadow Window    ${element} is not visible in Shadow Window    

Click OneTimeDonated Campaign
    [Arguments]    ${element}

    Click Element    xpath=(//div[contains(@class,'mycampine-section oneTime-shwhde')]//div[contains(@class,'donation chld-items')])[${element}]//div[@class='cld-nme']    
    
Get Pseudo Element CSS Attribute Value
    [Arguments]    ${locator}    ${pseudo_element}    ${attribute}
    # Get element using Xpath in JavaScript.
    # Note there are other options like getElementById/Class/Tag
    ${element}=    Set Variable    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},${pseudo_element}).getPropertyValue('${attribute}');
    Log   ${attribute_value}
    [Return]    ${attribute_value}

Select campaign Paid As SI in My Next Payment Page
    ${campaignCount}=    Get Element Count    xpath=//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')]
    FOR    ${element}    IN RANGE   1    ${campaignCount}+1
        ${after_content}=    Get Pseudo Element CSS Attribute Value    (//div[contains(@class,'mycampine-section')]//div[@class='cld-nme']//p[contains(text(),'')]/parent::div/parent::div)[${element}]    pseudo_element=':after'   attribute=content
        ${status}=    Run Keyword And Return Status    Should Contain    ${after_content}    Paid as SI
        Run Keyword If    '${status}'!='True'    Continue For Loop    ELSE    Click Donated Campaign in Normal Payment    ${element}
        Exit For Loop If    '${status}'=='True'
    END
    Run Keyword If    '${status}'!='True'    Fail    Currently there is are no campaign donated with normal Payment
    ${campaignName}=    Get Text    xpath=(//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')])[${element}]//div[@class='cld-nme']/p
    
    [Return]    ${campaignName}

Select Child Paid Not As SI in My Next Payment Page
    ${childCount}=    Get Element Count    xpath=//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')]
    FOR    ${element}    IN RANGE   1    ${childCount}+1
        ${after_content}=    Get Pseudo Element CSS Attribute Value    (//div[contains(@class,'mychildren-section')]//div[@class='cld-nme']//p[contains(text(),'')]/parent::div/parent::div)[${element}]    pseudo_element=':after'   attribute=content
        ${status}=    Run Keyword And Return Status    Should Not Contain    ${after_content}    Paid as SI
        Run Keyword If    '${status}'!='True'    Continue For Loop    ELSE    Click Donated SI Child    ${element}
        Exit For Loop If    '${status}'=='True'
    END
    Run Keyword If    '${status}'!='True'    Fail    Currently there is are no child donated with SI Payment
    ${childName}=    Get Text    xpath=(//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')])[${element}]//div[@class='cld-nme']/p

    [Return]    ${childName}

My Next Payment Add to cart
    Click Element    id=MP_add_to_cart_btn
    
Gift For The Child Apply Gift Button
    Click Element    xpath=//div[@id='GiftfortheChild']//a[@class='giftsubmit']    

Click Gift 500Rs
    Click Element    xpath=(//div[@id='GiftfortheChild']//span[contains(text(),'500')])[1]

Click Select All
    Click Element    xpath=//div[@id='GiftfortheChild']//div[@class='selectallchi']/label/input

Click Child Gift Amount
    [Arguments]    ${childName}
    
    Click Element    xpath=//div[@id='GiftfortheChild']//div[@class='cld-nme']/p[contains(text(),'${childName}')]/parent::div/parent::div/following-sibling::label//span[2]

Direct login for Make Payment
    Sleep    5s    
    Click Element    id=edit-name
    Input Text    id=edit-name    9600185121
    Click Element    id=edit-pass
    Input Text    id=edit-pass    123456
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]

Gift child checkbox verify
    [Arguments]    ${Child}
    
    ${status}=    Run Keyword And Return Status    Checkbox Should Be Selected    xpath=(//label[@class='thrd-inpt-chck-gftpay']/input)[${Child}]
    Run Keyword If    '${status}'!='True'    Fail    Checkbox is not selected    ELSE    Log    Checkbox is selected

Click Donated SI Child
    [Arguments]    ${element}
    
    Click Element    xpath=(//div[contains(@class,'mychildren-section')]//div[contains(@class,'child chld-items')])[${element}]//div[@class='cld-nme']

Click Donated Campaign in Normal Payment
    [Arguments]    ${element}
    
    Click Element    xpath=(//div[contains(@class,'mycampine-section')]//div[contains(@class,'campaign chld-items')])[${element}]//div[@class='cld-nme']
    
Click Edit Gift Amount
    Click Element    xpath=//div[@id='GiftfortheChild']//div[contains(@class,'editgiftamount')]//input    

Enter Gift Amount
    [Arguments]    ${GiftAmount}

    Input Text    xpath=//input[@name='giftforchildren' and @type='text']    ${GiftAmount}

Rotator left Nav button
    Click Element    xpath=//a[@class='left carousel-control']

Rotator Right Nav button
    Click Element    xpath=//a[@class='right carousel-control']

Rotator Sponsor Now Click
    Click Element    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[contains(@id,'edit-submit')]    

Rotator Sponsor Now Text Check
    ${status}=    Get Element Attribute    xpath=//div[@class='item active childRotator' or @class='item childRotator active']//input[contains(@id,'edit-submit')]    value
    Run Keyword If    '${status}'!='SPONSOR NOW'    Fail    Button Text is not changed to Add to Cart

Rotator Proceed to Checkout
    Click Element    xpath=//a[text()='Proceed to Checkout']

Offline Payment Option
    [Arguments]    ${option}
    
    Sleep    10s    
    Click Element    xpath=//label[@class='off-container' and contains(text(),'${option}')]/span

Child Menus Verify
    @{child_details}=    Get WebElements    xpath=//ul[@class='tab-mnu']/li/p
    FOR    ${element}    IN    @{child_details}
        ${text}=    Get Text    ${element}
        Log To Console    Details enabled for child:    ${text}    
    END

Indian Checkout Flow Payment Gateway Verify
    Sleep    15s    
    ${pageTitle}=    Get Title
    Should Contain    ${pageTitle}    Order information        
    ${checkout_payment_list}=    Get Element Count    xpath=//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    4!=${checkout_payment_list}    Fail    "Checkout flow Other passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    Indian Payment Gateway ${bank_txt} is mismatching    ELSE    Log    ${bank_txt} Payment gateway is matching    
    END

Proceed To Autopay Text Check
    ${button_text}=    Get Text    xpath=//div[@class='SIPopBlock']//button
    Run Keyword If    'PROCEED TO AUTOPAY'=='${button_text}'    Log    Button text changed to PROCEED TO AUTOPAY    ELSE    Fail    Button text was not changed to PROCEED TO AUTOPAY

Child Details 3 Menus
    @{child_details}=    Get WebElements    xpath=//ul[@class='tab-mnu']/li/p
    FOR    ${element}    IN    @{child_details}
        ${text}=    Get Text    ${element}
        Log    Details enabled for child:${text}    
    END
    
Click MyChild
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]

Click Project Meter
    Click Element    xpath=//p[contains(text(),'PROJECT METER')]
    
Click Upload Passport
    Sleep    5s    
    Click Element    id=edit-field-passport-photo-0-upload    
    
MyProfile Submit Button
    Sleep    2s    
    Click Element    id=edit-submit    
    
MyProfile Success Message
    Sleep    5s    
    Scroll Element Into View    xpath=//div[@class='success_msg']//h2
    ${Success}=    Get Text    xpath=//div[@class='success_msg']//h2
    Run Keyword If    '${Success}'!='Success!'    Fail    Success Message wasnt displayed
    
    ${changesMadeMsg}=    Get Text    class=messages__item
    Run Keyword If    '${changesMadeMsg}'!='The changes have been saved.'    Fail    Changes made message wasnt displayed
    
MyProfile Passport Image Remove
    Scroll Element Into View    xpath=//input[contains(@id,'edit-field-passport-photo-0-remove-button')]
    Click Element    xpath=//input[contains(@id,'edit-field-passport-photo-0-remove-button')]   
    MyProfile Submit Button 
    
MyProfile Passport Photo Check
    ${status}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//input[contains(@id,'edit-field-passport-photo-0-remove-button')]        
    Run Keyword If    '${status}'!='True'    MyProfile Passport Image Remove
    MyProfile Success Message
    
Upload Passport Photo
    Scroll Element Into View    id=edit-field-passport-photo-0-upload
    Element Status Check    id=edit-field-passport-photo-0-upload    Upload Passport Field is visible    Upload Passport Field is not visible
    Choose File    id=edit-field-passport-photo-0-upload    D://TestLeaf/Maven/WorldVisionWeb/Utils/testjpgfile.jpg
    
Verify Image is uploaded
    Scroll Element Into View    xpath=//span[contains(@class,'file--mime-image-jpeg')]/a
    ${jpgFile}=    Get Text    xpath=//span[contains(@class,'file--mime-image-jpeg')]/a
    Should Contain    ${jpgFile}    testjpgfile
    
Verify Upload Passport Photo Disabled
    ${status}=    Run Keyword And Return Status    Page Should Contain Element    id=edit-field-passport-photo-0-upload        
    Run Keyword If    '${status}'!='True'    Fail    Upload passport is visible for Indian User    ELSE    Log    Upload passport is not visible for Indian User
    
Click MyChild
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Child')]    
    
Verify Page Title
    [Arguments]    ${page}
    
    ${title}=    Get Title
    Should Contain    ${title}    ${page}
    
Verify MyChild Menu
    @{child_details}=    Get WebElements    xpath=//ul[@class='tab-mnu']/li/p
    FOR    ${element}    IN    @{child_details}
        ${text}=    Get Text    ${element}
        Log To Console    Details enabled for child:    ${text}    
    END    

Click MyProfile In MyChild Page
    Click Element    xpath=//p[contains(text(),'PROFILE')]   

Select Child in MyChild Page
    [Arguments]    ${child}
    
    Click Element    xpath=//div[@class='child_title' and contains(text(),'${child}')]
    

Convert Text Month To Numbers
    [Arguments]    ${Month}
    
    ${ReturnValue}=        Run Keyword If    '${Month}'=='Jan'    Return Jan Month
    ...    ELSE IF    '${Month}'=='Feb'    Return Feb Month
    ...    ELSE IF    '${Month}'=='Mar'    Return Mar Month
    ...    ELSE IF    '${Month}'=='Apr'    Return Apr Month
    ...    ELSE IF    '${Month}'=='May'    Return May Month
    ...    ELSE IF    '${Month}'=='Jun'    Return Jun Month
    ...    ELSE IF    '${Month}'=='Jul'    Return Jul Month
    ...    ELSE IF    '${Month}'=='Aug'    Return Aug Month
    ...    ELSE IF    '${Month}'=='Sep'    Return Sep Month
    ...    ELSE IF    '${Month}'=='Oct'    Return Oct Month
    ...    ELSE IF    '${Month}'=='Nov'    Return Nov Month
    ...    ELSE    Return Dec Month

    [Return]    ${ReturnValue}    

Return Jan Month
    ${var}=    Set Variable    01
    
    [Return]    ${var}
    
Return Feb Month
    ${var}=    Set Variable    02
    
    [Return]    ${var}
   
Return Mar Month
    ${var}=    Set Variable    03
    
    [Return]    ${var}
    
Return Apr Month
    ${var}=    Set Variable    04
    
    [Return]    ${var}

Return May Month
    ${var}=    Set Variable    05
    
    [Return]    ${var}

Return Jun Month
    ${var}=    Set Variable    06
    
    [Return]    ${var}

Return Jul Month
    ${var}=    Set Variable    07
    
    [Return]    ${var}

Return Aug Month
    ${var}=    Set Variable    08
    
    [Return]    ${var}

Return Sep Month
    ${var}=    Set Variable    09
    
    [Return]    ${var}

Return Oct Month
    ${var}=    Set Variable    10
    
    [Return]    ${var}

Return Nov Month
    ${var}=    Set Variable    11
    
    [Return]    ${var}

Return Dec Month
    ${var}=    Set Variable    12
    
    [Return]    ${var} 
    
Gift Submenu list verify
    FOR    ${element}    IN    @{GiftSubmenus}
        Element Status Check    xpath=//div[@class='makepaymentnew']/ul//a[contains(text(),'${element}')]    ${element} is visible in Gift menu    ${element} is not visible in Gift menu
        Click Element    xpath=//div[@class='makepaymentnew']/ul//a[contains(text(),'${element}')]
    END

Click My campaign
    Click Element    xpath=//div[@class='main-menu-inner']//*[contains(text(),'My Campaign')]        

Verify Illustartion in my campaign page
    Click My campaign
    Sleep    5s    
    ${NoCampaignText}=    Get Text    xpath=//div[@class='Empty_basket_Content']/h1
    Run Keyword If    '${NoCampaignText}'!='You Have Not Supported Any Cause'    Fail    Illustration is not visible in Mycampaign page    ELSE    Log    Illustration is visible in Mycampaign page    
    
Change Password in My profile Page
    [Arguments]    ${newPassword}    ${NewConfirmPassword}
    
    ${number}=    Generate Random String    length=3    chars=[NUMBERS]
    ${newUpdated}    Set Variable    ${newPassword}${number}

    Input Text    id=edit-pass-pass1    ${newPassword}${number}
    Input Text    id=edit-pass-pass2    ${NewConfirmPassword}${number}
    
    [Return]    ${newUpdated}
    
Reset Password in My profile Page
    [Arguments]    ${newPassword}    ${NewConfirmPassword}
    
    Sleep    10s    
    Input Text    id=edit-pass-pass1    ${newPassword}
    Input Text    id=edit-pass-pass2    ${NewConfirmPassword}

Password Updated Message
    Sleep    5s    
    
    Scroll Element Into View    xpath=//div[@class='success_msg']//h2
    ${Success}=    Get Text    xpath=//div[@class='success_msg']//h2
    Run Keyword If    '${Success}'!='Success!'    Fail    Success Message wasnt displayed
    
    ${pswdChangedMsg}=    Get Text    xpath=//ul[@class='messages__list']/li[1]
    Run Keyword If    '${pswdChangedMsg}'!='Changed password recently'    Fail    Password changed alert wasn't appeared    ELSE    Log    Password changed alert appeared
    
    ${ChangesUpdatedMsg}=    Get Text    xpath=//ul[@class='messages__list']/li[2]
    Run Keyword If    '${ChangesUpdatedMsg}'!='The changes have been saved.'    Fail    Password changed alert wasn't appeared    ELSE    Log    Password changed alert appeared
    
    # ${ChangesNotUpdatedMsg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//ul[@class='messages__list']/li[3]
    # Run Keyword If    '${ChangesNotUpdatedMsg}'=='True'    Fail    Password Not changed alert appeared
        
