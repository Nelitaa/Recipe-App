require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @food = Food.create!(name: 'Test Food', measurement_unit: 'kg', quantity: 1, price: 1, user_id: @user.id)
      @food2 = Food.create!(name: 'Test Food 2', measurement_unit: 'kg', quantity: 1, price: 1, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit foods_path
    end

    it 'should show all foods' do
      expect(page).to have_content('Test Food')
      expect(page).to have_content('Test Food 2')
    end

    it 'should show the food name' do
      expect(page).to have_content('Test Food')
    end

    it 'should show the food measurement unit' do
      expect(page).to have_content('kg')
    end

    it 'should show the food quantity' do
      expect(page).to have_content('1')
    end

    it 'should show the food price' do
      expect(page).to have_content('1')
    end

    it 'should show the food delete button' do
      expect(page).to have_content('Delete')
    end

    it 'should show the food new button' do
      expect(page).to have_content('Add food')
    end

    it 'should add a new food' do
      click_link('Add food')
      expect(page).to have_current_path(new_food_path)
    end
  end

  describe 'New' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @food = Food.create!(name: 'Test Food', measurement_unit: 'kg', quantity: 1, price: 1, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit new_food_path
    end

    it 'should show the food name field' do
      expect(page).to have_content('Name')
    end

    it 'should show the food measurement unit field' do
      expect(page).to have_content('Measurement unit')
    end

    it 'should show the food quantity field' do
      expect(page).to have_content('Quantity')
    end

    it 'should show the food price field' do
      expect(page).to have_content('Price')
    end

    it 'should show the food submit button' do
      expect(page).to have_button('Create Food')
    end

    it 'should create a new food' do
      fill_in 'food_name', with: 'Test Food'
      fill_in 'food_measurement_unit', with: 'kg'
      fill_in 'food_quantity', with: '1'
      fill_in 'food_price', with: '1'
      click_button 'Create Food'
      expect(page).to have_current_path(foods_path)
    end

    it 'should cancel the new food' do
      click_link('Back to foods')
      expect(page).to have_current_path(foods_path)
    end

    it 'should back to foods' do
      click_link('Back to foods')
      expect(page).to have_current_path(foods_path)
    end
  end
end
