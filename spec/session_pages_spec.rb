require 'rails_helper'

RSpec.describe 'Session and registration', type: :system do
  context 'Sing up page' do
    it 'have log out link when i sign up' do
      visit new_user_path
      fill_in 'Name', with: 'Italivi'
      click_on 'Sign up'
      expect(page).to have_link('Log out')
    end

    it 'can write a new article when i sign up' do
      visit new_user_path
      fill_in 'Name', with: 'Andrik'
      click_on 'Sign up'
      click_on 'New Article'
      expect(page).to have_content('Create An Article!')
    end

    it 'show an alert if the user already exists' do
      visit new_user_path
      fill_in 'Name', with: 'Andrik'
      click_on 'Sign up'
      expect(page).to have_content('User already exist')
    end
  end

  context 'Sing in page' do
    before(:all) { User.create(name: 'Italivi') }

    it 'i see an alert if the user doesn\'t exists' do
      visit user_sign_in_path
      fill_in 'Name', with: 'Lluis'
      click_on 'Sign in'
      expect(page).to have_content('User doesn\'t exist')
    end

    it 'i see the log out link when i sign in' do
      visit user_sign_in_path
      fill_in 'Name', with: 'Italivi'
      click_on 'Sign in'
      expect(page).to have_link('Log out')
    end

    it 'can write a new article when i sign up' do
      visit user_sign_in_path
      fill_in 'Name', with: 'Italivi'
      click_on 'Sign in'
      click_on 'New Article'
      expect(page).to have_content('Create An Article!')
    end
  end
end
