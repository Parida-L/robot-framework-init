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
${LOGIN_INPUT}           //*[@id="ap_email_login"]
${EMAIL_ADDRESS}         damien.automatisation@gmail.com 
&{PASSWORD}              amz=Aa123456!    sd=secret_sauce
${CONTINUE_BTN}          //*[@id="continue"]/span/input
${PASSWORD_INPUT_NAME}   Mot de passe
${PASSWORD_INPUT}        //*[@id="ap_password"]
&{SUBMIT_BTN_LOGIN}      amz=//*[@id="signInSubmit"]    sd=//*[@id="login-button"]
${WELCOME_TEXT}          Bonjour Damien

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
&{SD_USERNAME}        std=standard_user    lock=locked_out_user
${USERNAME_INPUT}     //*[@id="user-name"]
${PWD_INPUT}          //*[@id="password"]
