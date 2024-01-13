*** Settings ***
Resource    ../resources/main.robot

Test Setup    home_page.Open Browser To Login Page

*** Test Cases ***
Test Case 1 - Successful Login with valid credentials
    Given fill user and pass
    When confirm login
    Then product list are available