#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait as wait
from time import sleep
import threading,sys
creds = {'username':'admin','password':'thisisnotnecessarytoobtainbutifyoudidsomehowLETMEKNOW!!'}
url = 'http://127.0.0.1'
sleep_time = 10

def build_driver():
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    driver = webdriver.Chrome('/usr/local/bin/chromedriver',options=chrome_options)
    return driver

def login(driver):
    driver.get('{}/'.format(url))
    print("++ driver got /")
    driver.find_element_by_id('login_button').click()
    print("++ driver clicked login_button")
    sleep(2)
    driver.find_element_by_id('login_username').send_keys(creds.get('username'))
    driver.find_element_by_id('login_password').send_keys(creds.get('password'))
    print("++ driver filled out login form")
    sleep(2)
    driver.find_element_by_id('submit_login').submit()
    print("++ driver clicked submit on login form")
    sleep(2)
    return

def get_messages(driver):
    sleep(2)
    driver.find_element_by_id('get_messages_button').click()
    sleep(2)
    cnt = len(driver.find_elements_by_name('read_message_button'))
    return cnt

def get_message(driver,message_id):
    sleep(2)
    print('++ retrieving messages...')
    message = driver.find_element_by_id('read_{}'.format(message_id)).click()
    sleep(2)
    driver.find_element_by_id('close_message_button').click()
    driver.find_element_by_id('get_messages_button').click()
    return

def run_get_messages(message_id):
    driver = build_driver()
    login(driver)
    get_messages(driver)
    try:
        get_message(driver,message_id)
    except:
        pass

if __name__ == '__main__':
    print("++ running main loop")
    driver = build_driver()
    print("++ built main driver")
    driver.implicitly_wait(10)
    login(driver)
    print("++ main driver logged in")
    cnt = get_messages(driver)
    print("++ found messages: {}".format(cnt))
    driver.quit()
    if cnt > 1:
        print("++ retrieving {} messages".format(cnt-1))
        for i in range(cnt-1):
            x = threading.Thread(target=run_get_messages,args=(i,))
            x.start()
    sys.exit()


