require 'selenium-webdriver'

class HomeController < ApplicationController
  def index

    if params[:loginTest].present?

      driver = Selenium::WebDriver.for :firefox
      driver.navigate.to params[:loginTest][:Site_URL]

      usernametext = driver.find_element(:id, params[:loginTest][:username_Field_Id])
      usernametext.send_keys params[:loginTest][:username]

      passwordtext = driver.find_element(:id, params[:loginTest][:password_Field_Id])
      passwordtext.send_keys params[:loginTest][:password]

      signinbutton = driver.find_element(:id, params[:loginTest][:login_Button_Id])
      signinbutton.click

      wait = Selenium::WebDriver::Wait.new(:timeout => 20)
      wait.until { element = driver.find_element(:link_text, params[:loginTest][:logout_Menu_Text])
        element.click
      }

      element1 = driver.find_element(:link_text, 'Sign Out')
      element1.click
      puts "Using valid data login and logout functionality compleated Successfully!"

      driver.quit

      abort('test successful')
    end

  end
end
