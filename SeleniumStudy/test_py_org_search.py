import unittest # The unittest module is a built-in Python module based on Java’s JUnit. This module provides the framework for organizing the test cases.
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

# The test case class is inherited from unittest.TestCase. Inheriting from the TestCase class is the way to tell unittest module that this is a test case
class PythonOrgSearch(unittest.TestCase):

    # The setUp method is part of initialization. This method will get called before every test function which you are going to write in this test case class. 
    def setUp(self):
        #self.driver = webdriver.Firefox()
        self.driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

    # The test case method should always start with characters test. The first line inside this method creates a local reference to the driver object created in setUp method.
    def test_search_in_python_org(self):
        driver = self.driver
        driver.get("http://www.python.org")
        self.assertIn("Python", driver.title)
        elem = driver.find_element(By.NAME, "q")
        elem.send_keys("pycon")
        elem.send_keys(Keys.RETURN)
        self.assertNotIn("No results found.", driver.page_source)

    # The tearDown method will get called after every test method. This is a place to do all cleanup actions. In the current method, the browser window is closed. You can also call the quit method instead of close.
    def tearDown(self):
        self.driver.close()

# Final lines are some boilerplate code to run the test case.
if __name__ == "__main__":
    unittest.main()