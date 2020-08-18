*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String

*** Variables ***
${baseurl}        https://prod.worldvision.in/
${browser}        chrome
${rightside_menu_list}    7
${postlogin_menu_list}    6
${edu_child_amt}    4000
${hunger_free_camp_amt}    1000
${hunger_camp_name_space}    Free
${user_name}      9600185121
${password}       123456
${addon_val}      100
${real_gift_enter_val}    1000
${checkout_payment_list_no}    4
@{homepage_header_menu_txt}    About Us    Child Sponsorship    Ways to Give    Get Involved    Partnerships    Media
@{checkout_payment_list_text}    Powered by CC Avenue    Powered by AXIS BANK    POWERED BY HDFC BANK
@{SI_payment_list_text}    NET BANKING    Indian credit card
@{postlogin_homepage_header_menu_txt_list}    My World    My Child    My Campaign    Tax Receipts    Ways to Give    Explore More
@{postlogin_homepage_header_chck_menu_txt}    My World    My Child    My Campaign    Tax Receipts
@{Aboutus_submenu_txt}    Who We Are    How We Work    Where We Work    Our History    Our Accountability    Careers    Contact Us
@{Childsponsorship_submenu_txt}    How Sponsorship Works    Sponsor a Child    Stories of Change    Partners Speak    FAQs    Child Protection Policy
@{Get_involved}    Events    Volunteer
@{Media_submenu_txt}    Press Releases    News Articles    Blog    Publication
@{Partnership_submenu_txt}    Corporate

*** Test Cases ***
Valid username Invalid password
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    ${user_name}
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='InvalidUsername']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter username only try to login 'Invalid Credentials' error msg not display"
    Clear Element Text    id=edit-name

Invalid username and valid password
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-pass
    Input Text    id=edit-pass    ${password}
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='InvalidUsername']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter password only try to login 'Invalid Credentials' error msg not display"
    Clear Element Text    id=edit-pass

Ensure user can able to logout in direct login
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
    Mouse Over    xpath=.//li[@class='welcomesponsor']
    Click Element    xpath=.//ul[@class='mypro-lgot']/li/a[contains(.,'Logout')]
    ${ensure_prelogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//a[contains(text(),'Login')]
    Run Keyword If    'True'!='${ensure_prelogin_page}'    Fail    "User can't able to logout in direct login"
    
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
    ${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li
    Run Keyword If    '${headermenu_list}'!='${rightside_menu_list}'    Fail    "Header menu list size are mismatch"
    ${myworld_menus_name}=    Get Text    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[1]/a
    Run Keyword If    '${myworld_menus_name}'!='MY WORLD'    Fail    "My world menu text are different"
    FOR    ${menu_txt}    IN    @{homepage_header_menu_txt}
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'${menu_txt}')]
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
    ${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'About Us')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='7'    Fail    "About us sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Aboutus_submenu_txt}
        Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'About Us')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'About Us')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin About us submenu ${menu_txt} text are mismatch"
    END

Child Sponsorship submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Child Sponsorship')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='6'    Fail    "Child Sponsorship sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Childsponsorship_submenu_txt}
        Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Child Sponsorship')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Child Sponsorship')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Child Sponsorship submenu ${menu_txt} text are mismatch"
    END

Get involved submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Get Involved')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='2'    Fail    "Get involved sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Get_involved}
        Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Get Involved')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Get Involved')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Get Involved submenu ${menu_txt} text are mismatch"
    END
    
Media submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Media')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='4'    Fail    "Media sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Media_submenu_txt}
        Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Media')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Media')]/div//ul/li/a[contains(.,'${menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Prelogin Media submenu ${menu_txt} text are mismatch"
    END

Partnership submenu list verification
    #Local browser launch
    Jenkins browser launch
    ${headermenu_list}=    Get Element Count    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Partnerships')]/div//ul/li
    Run Keyword If    '${headermenu_list}'!='1'    Fail    "Partnerships sub menu list size are mismatch"
    FOR    ${menu_txt}    IN    @{Partnership_submenu_txt}
        Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Partnerships')]
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[contains(.,'Partnerships')]/div//ul/li/a[contains(.,'${menu_txt}')]
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
    ${footer_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='container carousel_Sponsor defaultHead darkHeader']
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

Checkout Flow payment gateway list and text check
    #Local browser launch
    Jenkins browser launch
    One time Hunger Free campaign
    View cart proceed button
    Login
    ${checkoutflow_postlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']
    Run Keyword If    'True'!='${checkoutflow_postlogin_page}'    Fail    "Checkout postlogin page not display"
    ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    4!=${checkout_payment_list}    Fail    "Checkout flow payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Payment Gateway ${bank_txt} text is mismatch'
    END
    #nedd to check campaign details

SI Flow payment gateway list and text check
    #Local browser launch
    Jenkins browser launch
    Rescue child campaign
    SI login
    ${check_SI_postlogin_page}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//form[@class='payment_selection_form']
    Run Keyword If    'True'!='${check_SI_postlogin_page}'    Fail    "SI post login page not display"
    ${SI_payment_list}=    Get Element Count    xpath=.//div[@class='payment-main-content']/div
    Run Keyword If    2!=${SI_payment_list}    Fail    "SI Flow payment gateway list mismatch"
    FOR    ${SI_payment_txt}    IN    @{SI_payment_list_text}
        ${SI_payment_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-main-content']/div[contains(.,'${SI_payment_txt}')]
        Run Keyword If    'True'!='${SI_payment_txt}'    Fail    "SI flow payment gateway ${SI_payment_txt} text are mismatch"
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
 
 Post login menus check
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Direct login
    ${postloginheadermenu_list}=    Get Element Count    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li
    Run Keyword If    '${postloginheadermenu_list}'!='${postlogin_menu_list}'    Fail    "Post login header main menu list size are mismatch"
    ${ways_to_give_menus_name}=    Get Text    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[5]/span
    Run Keyword If    '${ways_to_give_menus_name}'!='WAYS TO GIVE'    Fail    "Ways to givr menu text are different"
    ${explore_menu_txt}=    Get Text    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li[6]/span
    Run Keyword If    '${explore_menu_txt}'!='EXPLORE MORE'    Fail    "Explore more menu text are different"
    FOR    ${postlogin_menu_txt}    IN    @{postlogin_homepage_header_chck_menu_txt}
        ${menu_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//ul[@class='we-mega-menu-ul nav nav-tabs pst_mnu_prnt']/li/a[contains(.,'${postlogin_menu_txt}')]
        Run Keyword If    'True'!='${menu_txt_chck}'    Fail    "Postlogin home page ${menu_txt} text are mismatch"
    END   
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

Delete view cart campaign
    Click Element    xpath=(.//a[@class='remove-btn'])[1]
    ${gift_cart_msg}=    Get Text    xpath=.//div[@class='Empty_basket_Content']/h1
    Run Keyword If    '${gift_cart_msg}'!='Your Gift Cart Is Empty'    Fail    "In View cart page after complete deletion 'Your Gift Cart Is Empty' text not display"
    
Login
    Click Element   xpath=//input[@id='edit-login-custom-returning-customer-name']
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-name']    ${user_name}
    Click Element   xpath=//input[@id='edit-login-custom-returning-customer-password']
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-password']    ${password}
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    
View cart proceed button
    Click Element    xpath=.//input[@id='edit-checkout']
  
Direct login
    Input Text    id=edit-name    ${user_name}
    Input Text    id=edit-pass    ${password}
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]
    
SI login
    Click Element    xpath=.//input[@id='exampleInputEmail1']
    Input Text    xpath=.//input[@id='exampleInputEmail1']    ${user_name}
    Click Element    xpath=.//input[@id='exampleInputPassword1']
    Input Text    xpath=.//input[@id='exampleInputPassword1']    ${password}
    Click Element    id=si_login_btn
    ${si_postlogin_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-main-content']
    Run Keyword If    'True'!='${si_postlogin_chck}'    Fail    "SI flow Postlogin page not display"
    
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

One time Hunger Free campaign
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Hungerfree')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='add-to-cart-section']
    ${hunger_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    ${split_Hunger_name_with_rightside}=    Split String From Right    ${hunger_camp_name}    ${EMPTY}
    ${input_val}=    Get Text    xpath=.//input[@name='manualCart[0][amount]']
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
    Click Element    xpath=//a[@class='view_cart']
    ${hunger_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${split_Hunger_name_with_rightside}[0]')]
    Run Keyword If    'True'!='${hunger_camp_viewcart}'    Fail    "Hunger Free campaign not display in view cart page"
    ${replace_val}=    Replace String    ${input_val}    1    1,
    ${hunger_camp_amt_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-total-price__number views-align-center'][contains(.,'₹${replace_val}')]
    Run Keyword If    'True'!='${hunger_camp_amt_viewcart}'    Fail    "Hunger Free campaign amount are not display/mismatch in view cart page"

Rescue child campaign
    Mouse Over    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li/span[contains(.,'Ways to Give')]
    Click Element    xpath=(.//li/a[contains(.,'Rescue Children')])[1]
    Sleep    10s
    Click Element    xpath=.//div[@class='item-image']//img
    ${rescue_child_camp_name}=    Get Text    xpath=.//div[@class='inner_banner_pledge_content']/h2/div
    Click Element    xpath=(//div[@class='price save-malnourished-cart-sec'])[2]/label
    Click Element    xpath=.//button[@class='btn btn-primary si_modal_btn']
   
