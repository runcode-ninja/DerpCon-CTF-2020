#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait as wait
from bs4 import BeautifulSoup
import threading,time

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
    driver.get('{}/login.php'.format(url))
    driver.find_element_by_id('email').send_keys('admin@local.local')
    driver.find_element_by_id('password').send_keys('NOYOUDIDNOTNEEDTOGETTHISATALL!!!!!!!!!!')
    driver.find_element_by_id('do_login').click()

def get_admin(driver):
    driver.get("{}/admin.php".format(url))
    html = driver.page_source
    return html

def get_page(driver,page):
    print("++ getting page: {}".format(page))
    driver.get("{}{}".format(url,page))
    print("++ get page complete: {}".format(page))

def get_report_links(html):
    res = []
    soup = BeautifulSoup(html,'html.parser')
    links = soup.find_all("a", class_="report_links")
    for link in links:
        res.append(link.get('href'))
    print("++ found {} links".format(len(res)))
    return res

def get_report(link):
    driver = build_driver()
    print("++ driver built")
    login(driver)
    time.sleep(1)
    print("++ driver logged in")
    get_page(driver,link)

def del_report(link):
    driver = build_driver()
    login(driver)
    report_id = link.split('=')[-1]
    full_link = "/admin.php?del_report={}".format(report_id)
    get_page(driver,full_link)

if __name__ == '__main__':
    print("++ running main loop")
    driver = build_driver()
    login(driver)
    admin_source = get_admin(driver)
    links = get_report_links(admin_source)
    driver.quit()
    for link in links:
        x = threading.Thread(target=get_report, args=(link,))
        y = threading.Thread(target=del_report, args=(link,))
        x.start()
        y.start()
