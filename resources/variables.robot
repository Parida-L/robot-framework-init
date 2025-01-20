*** Variables ***

&{BASE_URL}              amz=https://www.amazon.fr    dct=https://www.decathlon.fr    sd=https://www.saucedemo.com/
&{SITE_NAME}             amz=amazon    dct=decathlon    sd=Swag Labs
&{SEARCH_TERM}           amz=chaussettes    dct=bonnet
&{COOKIES_OK}            amz=//*[@id="sp-cc-accept"]    dct=//*[@id="didomi-notice-agree-button"]
&{COOKIES_KO}            amz=//*[@id="sp-cc-rejectall-link"]    dct=//*[@id="didomi-popup"]/div/div/div/span

${BROWSER}               chrome
${TIMEOUT}               10s

#AMAZON
${LOGIN_LOCATOR}         //*[@id="nav-link-accountList"]
${LOGIN_INPUT_LOCATOR}   //*[@id="authportal-main-section"]/div[2]/div[2]/div[1]/form/div/div/div/div[1]/label
${LOGIN_INPUT_NAME}      e-mail
&{LOGIN_INPUT}           amz=//input[@id='ap_email']    sd=//*[@id="user-name"]
${EMAIL}                 damien.automatisation@gmail.com
&{PWD}                   amz=Aa123456!    sd=secret_sauce
&{CONTINUE_BTN}          amz=//*[@id="continue"]/span/input    sd=//*[@id="login-button"]
${PASSWORD_INPUT_NAME}   Mot de passe
&{PWD_INPUT}             amz=//*[@id="ap_password"]    sd=//*[@id="password"]
&{CONTINUE}              amz=//*[@id="signInSubmit"]    sd=//*[@id="login-button"]
&{WELCOME_TEXT}          amz=Bonjour Damien    sd=Swag Labs

#DECATH
${ITEM_LOCATOR}      //*[@id="app"]/main/div[2]/section[2]/div/div[1]
${ADD_CART_LOCATOR}  //*[@id="app"]/main/div[2]/section[2]/div/div[1]/div[4]/div/div/button
${FIRST_CARD_LOC}    //*[@id="vtmn-modal-description"]/div/div[2]/div[1]/div/span
${ITEM_TITLE}        BONNET DE SKI ADULTE - FISHERMAN - NOIR
${ADD_BTN}           //*[@id="vtmn-modal-description"]/div/div[2]/div[6]/button
${CART_ICON}         //*[@id="app"]/header/div[1]/nav[1]/div[4]/div[5]/a
${CART_ASSERT}       Panier
${ITEM_CART_ASS}     BONNET

#SAUCE DEMO
&{SD_LOGIN}        std=standard_user    lck=locked_out_user


#DEMOQA

&{DMQ_URL}         bk=https://demoqa.com/books    log=https://demoqa.com/login    sel=https://demoqa.com/selectable    dp=https://demoqa.com/date-picker    alt=https://demoqa.com/alerts    cb=https://demoqa.com/checkbox    reg=https://demoqa.com/register    int=https://demoqa.com/interaction   
${BOOK_TITLE}      Designing Evolvable
${AUTHOR}          Glenn Block et al.
&{PAGE_NAME}       bk=Book Store    log=Login    reg=Register   sel=Selectable    int=Interactions    
...    dp=Date Picker    alt=Alerts
&{SPE_LOC}         bk=//*[@id="searchBox"]    log=//*[@id="login"]    reg=//*[@id="newUser"]    
...    dp=//input[@id='datePickerMonthYearInput']    alt=//span[.='Alerts']
&{OPTION_A}        text=Morbi leo risus    locator=//*[@id="verticalListContainer"]/li[3]
&{OPTION_B}        text=Cras justo odio    locator=//*[@id="verticalListContainer"]/li[1]
&{OPTION_C}        text=One    locator=//*[@id="row1"]/li[1]
&{OPTION_D}        text=Five    locator=//*[@id="row2"]/li[2]
&{OPTION_E}        text=Nine    locator=//*[@id="row3"]/li[3]
