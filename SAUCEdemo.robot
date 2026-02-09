***Settings***
Library    Selenium2Library

***Test Cases***

open saucedemo webpage
    Open Browser    https://www.saucedemo.com/    Firefox 
    Close Browser

Login with valid credentials
    Open Browser    https://www.saucedemo.com/    Firefox 
    #Input Text    //*[@id="user-name"] standard_user
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Click Element    id:shopping_cart_container
    Close Browser

 
Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    Firefox 
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret
    Click Button    id:login-button
    Page Should Contain     Username and password do not match any user in this service
    Close Browser
   

Login with wrong username and valid password
    Open Browser    https://www.saucedemo.com/    Firefox 
    Input Text    id:user-name    standard
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Page Should Contain     Username and password do not match any user in this service
    Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    Firefox 
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Page Should Contain     Username is required
    Close Browser
    
Login without password
    Open Browser    https://www.saucedemo.com/    Firefox 
    Input Text    id:user-name    standard
    Click Button    id:login-button
    Page Should Contain     Password is required
    Close Browser

Buy product and complete checkout
     Open Browser    https://www.saucedemo.com/    Firefox 
    #Input Text    //*[@id="user-name"] standard_user
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Element    id:shopping_cart_container
    Click Button    id:checkout
    Input Text    id:first-name    kajsd
    Input Text    id:last-name    kajsd
    Input Text    id:postal-code    34571
    Click Button     id:continue
    Click Element    id:finish
