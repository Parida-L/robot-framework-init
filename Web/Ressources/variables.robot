*** Variables ***

&{BASE_URL}              amz=https://www.amazon.fr    dct=https://www.decathlon.fr
&{SITE_NAME}             amz=amazon    dct=decathlon
&{SEARCH_TERM}           amz=chaussettes    dct=bonnet
&{COOKIES_OK}            amz=//*[@id="sp-cc-accept"]    dct=//*[@id="didomi-notice-agree-button"]
&{COOKIES_KO}            amz=//*[@id="sp-cc-rejectall-link"]    dct=//*[@id="didomi-popup"]/div/div/div/span

${BROWSER}               chrome
${TIMEOUT}               10s

#AMAZON
#${ACCEPT_COOKIES_BTN}    //*[@id="sp-cc-accept"]
${LOGIN_ICON}            //*[@id="nav-link-accountList"]
${LOGIN_TITLE_LOCATOR}   //*[@id="claim-collection-container"]/h1
${LOGIN_TITLE}           Identifiez-vous ou créez un compte
${EMAIL_INPUT}           //*[@id="ap_email_login"]
${EMAIL_ADDRESS}         damien.automatisation@gmail.com 
${PASSWORD}              Aa123456!
${CONTINUE_BTN}          //*[@id="continue"]/span/input
${PASSWORD_INPUT_NAME}   Mot de passe
${PASSWORD_INPUT}        //*[@id="ap_password"]
${SUBMIT_BTN_LOGIN}      //*[@id="signInSubmit"]
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
