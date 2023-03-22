require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @recipe = Recipe.create!(name: 'Test Recipe', preparation_unit: 1, cooking_time: 1,
                               description: 'Test Description', public: true, user_id: @user.id)
      @recipe2 = Recipe.create!(name: 'Test Recipe 2', preparation_unit: 1, cooking_time: 1,
                                description: 'Test Description 2', public: true, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit recipes_path
    end

    it 'should show the recipe description' do
      expect(page).to have_content('Test Description')
    end

    it 'should show the recipe delete button' do
      expect(page).to have_content('Remove')
    end

    it 'should show the recipe new button' do
      expect(page).to have_content('New recipe')
    end

    it 'should add a new recipe' do
      click_link('New recipe')
      expect(page).to have_current_path(new_recipe_path)
    end
  end

  describe 'New' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @recipe = Recipe.create!(name: 'Test Recipe', preparation_unit: 1, cooking_time: 1,
                               description: 'Test Description', public: true, user_id: @user.id)
      @recipe2 = Recipe.create!(name: 'Test Recipe 2', preparation_unit: 1, cooking_time: 1,
                                description: 'Test Description 2', public: true, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit recipes_path
      visit new_recipe_path
    end

    it 'should create a new recipe' do
      fill_in 'recipe_name', with: 'Test Recipe 3'
      fill_in 'recipe_description', with: 'Test Description 3'
      click_button 'Create Recipe'
      expect(page).to have_current_path(recipes_path)
    end

    it 'should not create a new recipe' do
      click_button 'Create Recipe'
      expect(page).to have_current_path(recipes_path)
    end

    it 'should show the recipe name' do
      expect(page).to have_content('Name')
    end

    it 'should show the recipe description' do
      expect(page).to have_content('Description')
    end

    it 'should show the recipe preparation unit' do
      expect(page).to have_content('Preparation unit')
    end

    it 'should show the recipe cooking time' do
      expect(page).to have_content('Cooking time')
    end

    it 'should show the recipe public' do
      expect(page).to have_content('Public')
    end

    it 'should show the recipe create button' do
      expect(page).to have_button('Create Recipe')
    end

    it 'should show the back button' do
      expect(page).to have_content('Back to recipes')
    end
  end

  describe 'Show' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @recipe = Recipe.create!(name: 'Test Recipe', preparation_unit: 1, cooking_time: 1,
                               description: 'Test Description', public: true, user_id: @user.id)
      @recipe2 = Recipe.create!(name: 'Test Recipe 2', preparation_unit: 1, cooking_time: 1,
                                description: 'Test Description 2', public: true, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit recipe_path(@recipe)
    end

    it 'should show the recipe preparation Time' do
      expect(page).to have_content('Preparation Time')
    end

    it 'should show the recipe cooking Time' do
      expect(page).to have_content('Cooking Time')
    end

    it 'should show the recipe public' do
      expect(page).to have_content('Public')
    end

    it 'should show the recipe steps' do
      expect(page).to have_content('Steps')
    end

    it 'should show the recipe new ingredient' do
      expect(page).to have_content('Add ingredient')
    end

    it 'should show the Generate shopping list button' do
      expect(page).to have_content('Generate shopping list')
    end
  end
end
