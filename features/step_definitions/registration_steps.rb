require 'capybara/cucumber'
require 'faker'
require_relative '../support/capybara'
require_relative '../../user'

  Given(/^I am on the registration page$/) do
    begin
      visit 'http://kudapostupat.by/register'
    rescue
      pending # Write code here that turns the phrase above into concrete actions
    end
  end

  When(/^I register the user$/) do
    begin
      @user = User.new(Faker::Lorem::word, Faker::Internet::password, Faker::Internet::email, Faker::Lorem::word, 2016)
      fill_in 'user_login', with: @user.login
      fill_in 'passw', with: @user.password
      fill_in 'passw2', with: @user.password
      fill_in 'user_email', with: @user.email
      fill_in 'user_name', with: @user.name
      fill_in 'tyear', with: @user.age
      click_button 'Зарегистрироваться'
    rescue
      pending # Write code here that turns the phrase above into concrete actions
    end
  end

  Then(/^I should save user in file$/) do
    begin
      file = File.open("seeds.txt", "a+")
      file.write(@user.message)
    rescue IOError => e
      #some error occur, dir not writable etc.
    rescue
      pending # Write code here that turns the phrase above into concrete actions
    ensure
      file.close unless file.nil?
    end
  end



