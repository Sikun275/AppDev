from selenium import webdriver
from selenium.webdriver.common.keys import Keys # The Keys class provide keys in the keyboard like RETURN, F1, ALT etc.
from selenium.webdriver.common.by import By # The By class is used to locate elements within a document.

# these two lines are for chrome driver
from selenium.webdriver.chrome.service import Service 
from webdriver_manager.chrome import ChromeDriverManager

# driver = webdriver.Firefox()
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.get("http://www.python.org") #The driver.get method will navigate to a page given by the URL. WebDriver will wait until the page has fully loaded (that is, the “onload” event has fired) before returning control to your test or script.
assert "Python" in driver.title #This is an assertion to confirm that title has the word “Python” in it
elem = driver.find_element(By.NAME, "q") #WebDriver offers a number of ways to find elements using the find_element method. 
elem.clear() #To be safe, we’ll first clear any pre-populated text in the input field (e.g. “Search”) so it doesn’t affect our search results
elem.send_keys("pycon") # Special keys can be sent using the Keys class
elem.send_keys(Keys.RETURN)
assert "No results found." not in driver.page_source #After submission of the page, you should get the result if there is any. To ensure that some results are found, make an assertion.
driver.close() #Finally, the browser window is closed. You can also call the quit method instead of close. The quit method will exit the browser whereas close will close one tab.


'''
This script is a simple Selenium automation example that:
	1.	Launches Chrome
	2.	Navigates to the official python.org
	3.	Searches for the term "pycon" in the site’s search bar
	4.	Submits the search
	5.	Checks that the results do NOT contain the message "No results found."
	6.	Closes the browser
'''