require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  user = described_class.create(
    email: "test@jungle.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "password123",
    password_confirmation: "password123"
  )
  

  describe 'Validations' do
    it "should be vaild if all fields are present" do
      expect(user).to be_valid
    end

    it "should be created with password and password_confirmation fields" do
      user1 = User.create(
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: "password45"
      )
      user2 = User.create(
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: "password",
        password_confirmation: "password123"
      )
      expect(user1).to_not be_valid
      expect(user2).to_not be_valid
    end

    it "should make sure that emails registered are unique" do
      user1 = User.create(
        email: 'TEST@TEST.com',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: "password123",
        password_confirmation: "password123"
      )
      user2 = User.create(
        email: 'test@test.com',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: "password123",
        password_confirmation: "password123"
      )
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end

    it "should be invalid if created without an email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "should be invalid if created without an first_name" do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it "should be invalid if created without an last_name" do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it "should be invalid if password is less than 8 characters" do
      user.password = "abc"
      user.password_confirmation = "xyz"
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "should be true if email and password match the credentials.(Email is not case-sensitive and password is" do 
      user1 = User.authenticate_with_credentials("test@jungle.com", "password123")
      user2 = User.authenticate_with_credentials("test@test.com", "Password123")
      user3 = User.authenticate_with_credentials("TEST@test.com", "password123")
      user4 = User.authenticate_with_credentials("    test@jungle.com", "password123")
      expect(user1).to be_truthy
      expect(user2).to be_nil
      expect(user3).to be_nil
      expect(user4).to be_truthy
    end
  end

end
