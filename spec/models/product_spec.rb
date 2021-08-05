require 'rails_helper'
RSpec.describe Product, type: :model do
    brand = Brand.first
    


    describe '#title' do
        it 'has no title' do
            product = Product.new(
                brand: brand,
                title: nil,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'title minimum length' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to be_valid
        end

        it 'title maximum length' do
            product = Product.new(
                brand: brand,
                title: "a" * 30,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to be_valid
        end

        it 'title minimum length lower bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 4,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'title minimum length upper bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 6,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to be_valid
        end

        it 'title maximum length lower bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 29,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to be_valid
        end

        it 'title maximum length upper bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 31,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'title Uniqueness check' do
            product1 = Product.new(
                brand: brand,
                title: "a" * 30,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            product1.save
            product2 = Product.new(
                brand: brand,
                title: "A" * 30,
                price: 20000,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product2).to_not be_valid
        end

    end



    describe '#Description' do
        it 'has no Description' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: nil 
            )
            expect(product).to_not be_valid
        end

        it 'description minimum length' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 10 
            )
            expect(product).to be_valid
        end

        it 'description maximum length' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 500 
            )
            expect(product).to be_valid
        end

        it 'description minimum length lower bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 9 
            )
            expect(product).to_not be_valid
        end

        it 'description minimum length upper bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 11 
            )
            expect(product).to be_valid
        end

        it 'description maximum length lower bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 499 
            )
            expect(product).to be_valid
        end

        it 'description maximum length upper bound check' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20000,
                quantity: 1,
                description: "a" * 501 
            )
            expect(product).to_not be_valid
        end

    end

    describe '#price' do
        it 'price decimal check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 20.25,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end
        it 'price nil check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: nil,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end
        it 'price string check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: "avc",
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'Minimum Price lower bound' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 499,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end


        it 'Minimum Price upper bound' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 501,
                quantity: 1,
                description: "a" * 20 
            )
            expect(product).to be_valid
        end
    end


    describe '#quantity' do
        it 'quantity decimal check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 1000,
                quantity: 1.1,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'quantity string check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 1000,
                quantity: "1.1",
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'quantity nil check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 1000,
                quantity: nil,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

        it 'quantity zero check ' do
            product = Product.new(
                brand: brand,
                title: "a" * 5,
                price: 1000,
                quantity: 0,
                description: "a" * 20 
            )
            expect(product).to_not be_valid
        end

    end

end