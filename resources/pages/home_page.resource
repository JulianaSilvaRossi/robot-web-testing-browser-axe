*** Settings ***
Library    Browser

*** Variables ***

${BROWSER}      chromium
${HEADLESS}     false
${BASE_URL}     https://front.serverest.dev/login

${txt_email}    //input[@name='email']
${txt_pass}     //input[@name='password']
${btn_pass}     text=Entrar
${lbl_login}    text=Login
${lbl_product}  text=Produtos
${lbl_store}    text=Serverest Store

${home_email}  autotest@gmail.com
${home_pass}   admin123

*** Keywords ***
Open Browser To Login Page
    New Browser                browser=${BROWSER}    headless=${HEADLESS}
    New Context                viewport={'width': 1280, 'height': 800}
    
    New Page                   url=${BASE_URL}
    Wait For Elements State    ${lbl_login}

fill user and pass
    Fill Text        ${txt_email}    ${home_email}
    Set Log Level    level=NONE
    Fill Text        ${txt_pass}     ${home_pass}
    Set Log Level    level=INFO

confirm login
    Click    ${btn_pass}
    Wait For Elements State    ${lbl_product}

product list are available
    Wait For Elements State    ${lbl_store}