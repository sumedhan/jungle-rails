require 'rails_helper'
require 'faker'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it "should be valid with all attributes set" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: "Micheal Scott",
        quantity: 100,
        price: 6001.69
      )
      expect(product).to be_valid
    end

    it "should be invalid if name is not set" do
      cat = Category.find_or_create_by! name: 'Kitchen'
      product = cat.products.create(
        name: nil,
        quantity: 1,
        price: 10000.23
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to_not be_empty
    end


    it "should be invalid if quantity is not set" do
      cat = Category.find_or_create_by! name: 'Electronics'
      product = cat.products.create(
        name: Faker::Name.name,
        quantity: nil,
        price: 10000.23
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to_not be_empty
    end

    it "should be invalid if price is not set" do
      cat = Category.find_or_create_by! name: 'Furniture'
      product = cat.products.create(
        name: Faker::Name.name,
        quantity: 100,
        price: nil
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to_not be_empty
    end

    it "should be invalid if category is not set" do
      product = Product.create(
        name: Faker::Name.name,
        quantity: 20,
        price: 100
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to_not be_empty
    end

  end
end
