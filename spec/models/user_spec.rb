require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should save successfully if all fields are valid" do
      user_params = { first_name: "Anna", last_name: "Green", email: "anna@email.com", password: "12345", password_confirmation: "12345" }
      user = User.new(user_params)
      expect(user.save).to be true
    end

    it "should create new user when password and password_confirmation match" do
      user_params = { first_name: "Anna", last_name: "Green", email: "anna@email.com", password: "12345", password_confirmation: "12345" }
      user = User.new(user_params)
      expect(user.save).to be true
    end

    it "should not create new user when password and password_confirmation don't match" do
      user_params = { first_name: "Anna", last_name: "Green", email: "anna@email.com", password: "12345", password_confirmation: "67890" }
      user = User.new(user_params)
      expect(user.save).to be false
    end
   
    it "email must be unique" do
      user_params1 = { first_name: "Anna", last_name: "Green", email: "anna@email.com", password: "12345", password_confirmation: "12345" }
      user_params2 = { first_name: "Anna", last_name: "Green", email: "ANNA@EMAIL.COM", password: "12345", password_confirmation: "12345" }
      user1 = User.new(user_params1)
      user2 = User.new(user_params2)
      user1.save
      expect(user2.save).to be false
      # expect(user2).to_not be_valid
    end

    it "should save if password has a minimum length of 5" do
      user_params = { first_name: "Anna", last_name: "Green", email: "anna@email.com", password: "12345", password_confirmation: "12345" }
      user = User.new(user_params)
      expect(user.save).to be true
    end

    it "should not save if password's length is lees than 5" do
      user_params = { first_name: "Anna", last_name: "Green", email: "anna@email.com", password: "1234", password_confirmation: "1234" }
      user = User.new(user_params)
      expect(user.save).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate if user exist in the database" do
      user_params = { first_name: "Anna", last_name: "Green", email: "ANNA@email.com", password: "12345", password_confirmation: "12345" }
      user = User.new(user_params)
      user.save
      logged_in_user = User.authenticate_with_credentials("anna@email.com", "12345")
      puts logged_in_user.email.inspect
      expect(logged_in_user.email).to eql(user.email)
    end   
  end
end
