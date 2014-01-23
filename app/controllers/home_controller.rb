require 'selenium-webdriver'

class HomeController < ApplicationController
  def index

    #Firefox browser instantiation
    driver = Selenium::WebDriver.for :firefox

    #Loading the Qubole URL
    driver.navigate.to "http://www.facebook.com"

    #User name input field identification and data entered
    usernametext = driver.find_element(:id, 'email')
    usernametext.send_keys "providerlm@gmail.com" #put your actual username

    #Password input field identification and data entered
    passwordtext = driver.find_element(:id, 'pass')
    passwordtext.send_keys "123456" #put your actual password

    #Sign in button identification and click it
    signinbutton = driver.find_element(:id, 'u_0_o')
    signinbutton.click

    #Click Kousik to view Drop-down Menu
    wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
    wait.until { element = driver.find_element(:link_text, 'Kousik')
      element.click
    }

    #Identify signout link and click on it
    element1 = driver.find_element(:link_text, 'Sign Out')
    element1.click
    puts "Using valid data login and logout functionality compleated Successfully!"

    #Quitting the browser
    driver.quit
  end
end
