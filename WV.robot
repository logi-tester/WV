*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String

*** Variables ***
${baseurl}        https://prod.worldvision.in/
${browser}        chrome
${rightside_menu_list}    7
${edu_child_amt}    4000
${hunger_free_camp_amt}    1000
${hunger_camp_name_space}    Free
${user_name}      ${9600185121}
${password}       ${123456}
${txt}            Hunger Free
@{homepage_header_menu_txt}    ABOUT US    CHILD SPONSORSHIP    WAYS TO GIVE    GET INVOLVED    PARTNERSHIPS    MEDIA

*** Test Cases ***


Normal Login validation
    #Local browser launch
    Jenkins browser launch
    Click Element    xpath=//a[contains(text(),'Login')]
    Click Element    id=edit-name
    Input Text    id=edit-name    ${user_name}
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='InvalidUsername']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter username only try to login 'Invalid Credentials' error msg not display"
    Clear Element Text    id=edit-name
    Click Element    id=edit-pass
    Input Text    id=edit-pass    ${password}
    ${pswd_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='InvalidUsername']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter password only try to login 'Invalid Credentials' error msg not display"

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
    Input Text    id=edit-pass    ${passowrd}
    Click Element    xpath=//div[@class='login-form__submit']//button
    ${username_validation}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='InvalidUsername']
    Run Keyword If    'True'!='${username_validation}'    Fail    "Enter password only try to login 'Invalid Credentials' error msg not display"
    Clear Element Text    id=edit-pass

Hungree one time campaign
    #Local browser launch
    Jenkins browser launch
    One time Hunger Free campaign

Educate children campaign
    #Local browser launch
    Jenkins browser launch
    Educate children campaign with checkout flow

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
    Log To Console    Header menu list size is:${headermenu_list}
    Run Keyword If    '${myworld_menus_name}'!='MY WORLD'    Fail    "My world menu text are different"
    FOR    ${INDEX}    IN RANGE    2    ${headermenu_list}
        ${header_menus_name}=    Get Text    xpath=//div[@id='block-tbmegamenu-2']//ul[@class='we-mega-menu-ul nav nav-tabs']/li[${INDEX}]/span
        #Log To Console    Menus text:${header_menus_name}
    #Sleep    10s
      Continue For Loop If    '${header_menus_name}'=='ABOUT US'
     Continue For Loop If    '${header_menus_name}'=='CHILD SPONSORSHIP'
     Continue For Loop If    '${header_menus_name}'=='WAYS TO GIVE'
     Continue For Loop If    '${header_menus_name}'=='GET INVOLVED'
     Continue For Loop If    '${header_menus_name}'=='PARTNERSHIPS'
     Continue For Loop If    '${header_menus_name}'=='MEDIA'
    END

Search
    Jenkins browser launch
    Click Element    xpath=.//span[@class='Sub_head_search']
    Input Text    id=edit-search-api-fulltext    ksngjdsnfjksdfj
    Click Element    id=edit-submit-wv-custom-search
    Element Should Be Visible    xpath=.//h3[@class='wv_sugg_search']

Header and footer verification
    Jenkins browser launch
    Element Should Be Visible    xpath=.//header[@id='header']
    Sleep    4s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Element Should Be Visible    xpath=.//footer

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
    Run Keyword If    'True'!='${footer_status}'    Fail    "Home Page Footer section not displayed"
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
    Educate children campaign
    ${view_cart_total_amt}=    Get Text    xpath=.//div[@class='order-total-line order-total-line__total']/span[2]
    Log To Console    View cart total amount:${view_cart_total_amt}
    ${edu_camp+child_camp_total_amt}=    Calculation amount    ${sel_child_amt}    ${edu_child_amt}
    Run Keyword If    '${view_cart_total_amt}'!='${edu_camp+child_camp_total_amt}'    Fail    "View cart page total amount and child+educate campaign amount are mismatch"
    Click Element    xpath=.//input[@id='edit-checkout']


*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    1s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Go To    ${baseurl}
    Maximize Browser Window
    Set Browser Implicit Wait    15s

Local browser launch
    Set Selenium Speed    .5s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    60s

Calculation amount
    [Arguments]    ${child_amt}    ${edu_camp_amt}
    ${total_amt}=    Evaluate    ${child_amt}+${edu_camp_amt}
    [Return]    ${total_amt}

Login
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-name']    ${user_name}
    Input Text    xpath=//input[@id='edit-login-custom-returning-customer-password']    ${password
    Click Element    xpath=(//div[@class='login-form__submit']/button)[1]

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
    #Click Element    xpath=.//input[@class='commerce_manual_input realgift_inputvalue realgift_input valid']
    Click Element    xpath=//div[@class='kl_flood_sub_or_sec']
    ${success_mgs}=    Get Text    xpath=.//h2[@class='chat-text']
    Run Keyword If    '${success_mgs}'!='Success !'    Fail    "Success ! msg not found"
    Click Element    xpath=//a[@class='view_cart']
    ${hunger_camp_viewcart}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//td[@class='views-field views-field-product-id'][contains(.,'${split_Hunger_name_with_rightside}[0]')]
    Run Keyword If    'True'!='${hunger_camp_viewcart}'    Fail    "Hunger Free campaign not display in view cart page"
    ${replace_val}=    Replace String    ${hunger_free_camp_amt}    1    1,
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
    Click Element    xpath=.//input[@id='exampleInputEmail1']
    Input Text    xpath=.//input[@id='exampleInputEmail1']    ${user_name}
    Click Element    xpath=.//input[@id='exampleInputPassword1']
    Input Text    xpath=.//input[@id='exampleInputPassword1']    ${password}
    Click Element    id=si_login_btn
    ${si_postlogin_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=
    Run Keyword If    'True'!='${si_postlogin_chck}'    Fail    "SI flow Postlogin page not display"
