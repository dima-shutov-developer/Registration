require 'capybara/cucumber'
require 'faker'
require 'csv'

require_relative '../support/capybara'
require_relative '../../user'

  Given(/^I am on the registration page$/) do
    begin
      visit 'http://kudapostupat.by/register'
      @user_array = [] # Need for saving in file
    rescue
      pending # Write code here that turns the phrase above into concrete actions
    end
  end

  When(/^I register the user (\d+) times$/) do |count|
    count.to_i.times do
      @user = User.new(Faker::Lorem::word, Faker::Internet::password, Faker::Internet::email, Faker::Lorem::word)
      fill_in 'user_login', with: @user.login
      fill_in 'passw', with: @user.password
      fill_in 'passw2', with: @user.password
      fill_in 'user_email', with: @user.email
      fill_in 'user_name', with: @user.name
      fill_in 'tyear', with: Date.today.year
      click_button 'Зарегистрироваться'
      @user_array << @user
    end
  end

  Then(/^I should save user in file$/) do
    begin
      CSV.open('file.csv', 'a+', {:col_sep => ';'}) do |csv|
        csv << %w(Email Login Password)
        @user_array.each do |user|
          csv << [user.email, user.login, user.password]
        end
      end
    rescue
      pending # Write code here that turns the phrase above into concrete actions
    end
  end

