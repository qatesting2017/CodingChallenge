require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
wait = Selenium::WebDriver::Wait.new(timeout: 10)
driver.navigate.to "https://staging.joordev.com/"

element = driver.find_element(class: 'login-button').click

form = driver.find_element(id: 'side-nav-login').find_element(name: 'data[User][username]').send_keys 'qatest1'
form = driver.find_element(id: 'side-nav-login').find_element(name: 'data[User][password]').send_keys 'qatest1'
form = driver.find_element(id: 'side-nav-login').find_element(name: 'data[User][password]').submit

wait.until { driver.find_element(link: 'Messages').click }
wait.until { driver.find_element(link: 'Compose Mail').click }

rb = wait.until {
element = driver.find_element(id: 'MessageSendToSelectConnections')
element if element.displayed? }
rb.click

recipients = wait.until {
element = driver.find_element(name: 'recipient')
element if element.displayed? }

recipients.send_keys "JOOR Florida"
dropdown = wait.until {
element = driver.find_element(class: 'ui-menu-item')
element if element.displayed? }
dropdown.send_keys :down, :enter

recipients.send_keys "JOOR Regress"
dropdown = wait.until {
element = driver.find_element(class: 'ui-menu-item')
element if element.displayed? }
dropdown.send_keys :down, :enter

recipients.send_keys "NMD"
dropdown = wait.until {
element = driver.find_element(class: 'ui-menu-item')
element if element.displayed? }
dropdown.send_keys :down, :enter

element = driver.find_element(id: 'MessageSubject').send_keys "Testing - Please Disregard"
element = driver.find_element(id: 'MessageBody').send_keys "Hello, this is a test email - please ignore."
element = driver.find_element(link: 'Send').click

driver.navigate.to "https://staging.joordev.com/users/logout"

driver.quit
