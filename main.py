from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import time

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install())) 

driver.get("https://www.google.com/")

WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CLASS_NAME, "gLFyf"))
)


input_element = driver.find_element(By.CLASS_NAME, "gLFyf")
input_element.clear()
input_element.send_keys("Wes Andrewson" + Keys.ENTER)


WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.PARTIAL_LINK_TEXT, "Wes Andrewson"))
)

link = driver.find_element(By.PARTIAL_LINK_TEXT, "Wes Andrewson")
link.click()


time.sleep(15)

driver.quit() 
