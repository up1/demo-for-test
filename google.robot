*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***
ค้นหาคำว่า robot ได้นะ
	เข้าไปยัง google
	ค้นหาคำว่า robotframework
	จะต้องเจอ link ไปยัง website robotframework

*** Keywords ***
จะต้องเจอ link ไปยัง website robotframework
	Wait Until Page Contains    Robot Framework

ค้นหาคำว่า robotframework
	Input Text   name:q   robotframework
	Press Keys   name:q   RETURN

เข้าไปยัง google
	Open Browser   https://www.google.com   browser=chrome  remote_url=http://159.223.80.233/wd/hub  desired_capabilities=browserName:chrome
	Maximize Browser Window


