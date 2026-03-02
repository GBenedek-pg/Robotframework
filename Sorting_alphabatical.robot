*** Settings ***
Library    Selenium2Library
Library    Collections
Resource    LoginKeywords.robot

*** Test Cases ***
Sort products Z to A
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get all products
    Verify Z to A sorting    ${product_names}
    Sleep    2s
    Close Browser

Sort products A to Z
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get all products
    Verify A to Z sorting    ${product_names}
    Sleep    2s
    Close Browser

Sort products price low to high
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${product_prices}=    Get all products price
    Verify price low to high    ${product_prices}
    Sleep    2s
    Close Browser
   




*** Keywords ***
Get all products
    ${products}=    Create List
    @{product_element}=    Get WebElements    class:inventory_item_name
    
    FOR    ${element}    IN    @{product_element}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}
    
Verify Z to A sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List     ${product_names}    ${index}
        ${next}    Get From List     ${product_names}    ${index + 1}
        Should Be True    '${current}' >= '${next}'    Product not in Z to A order ${current} < ${next}

    END
    
Verify A to Z sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List     ${product_names}    ${index}
        ${next}    Get From List     ${product_names}    ${index + 1}
        Should Be True    '${current}' <= '${next}'    Product not in A to Z order ${current} > ${next}

    END

Verify price low to high 
    [Arguments]    ${product_price}
    ${length}=    Get Length    ${product_price}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}    Get From List     ${product_price}    ${index}
        ${next}    Get From List     ${product_price}    ${index + 1}
        Should Be True    ${current} <= ${next}    Products not in low to high price ${current} > ${next}

    END

Get all products price
    ${products}=    Create List
    @{product_prices}=    Get WebElements    class:inventory_item_price
    
    FOR    ${element}    IN    @{products}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_prices}
    END
    RETURN    @{products}




