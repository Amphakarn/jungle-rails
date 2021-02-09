require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should save successfully if all fields are valid" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "12345")
      expect(user.save).to be true
    end

    it "should create new user when password and password_confirmation match" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "12345")
      expect(user.save).to be true
    end

    it "should not create new user when password and password_confirmation don't match" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "67890")
      expect(user.save).to be false
    end
   
    it "email must be unique (not case sensitive)" do
      user1 = User.new(first_name: "Anna", 
                       last_name: "Green", 
                       email: "anna@email.com", 
                       password: "12345", 
                       password_confirmation: "12345")
      user2 = User.new(first_name: "Anna", 
                       last_name: "Green", 
                       email: "ANNA@EMAIL.COM", 
                       password: "12345", 
                       password_confirmation: "12345")
      user1.save
      expect(user2.save).to be false
      # expect(user2).to_not be_valid
    end

    it "email, first name, and last name should be required" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "12345")
      expect(user.save).to be true
    end

    it "should save if password has a minimum length of 5" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "12345")
      expect(user.save).to be true
    end

    it "should not save if password's length is lees than 5" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "1234", 
                      password_confirmation: "1234")
      expect(user.save).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate if user exist in the database" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "12345")
      user.save
      logged_in_user = User.authenticate_with_credentials("anna@email.com", "12345")
      expect(logged_in_user.email).to eql(user.email)
    end

    it "should still authenticate successfully even if user types in the wrong case for email" do
      user = User.new(first_name: "Anna", 
                      last_name: "Green", 
                      email: "anna@email.com", 
                      password: "12345", 
                      password_confirmation: "12345")
      user.save
      logged_in_user = User.authenticate_with_credentials("ANNA@EMAIL.COM", "12345")
      expect(logged_in_user.email).to eql(user.email)
    end   
  end
end
