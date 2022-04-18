require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  before do
    @employee = FactoryBot.build(:employee)
  end

  it 'signs up' do
    visit '/employees/sign_up'
    within('form') do
      fill_in 'Email', with: @employee.email
      fill_in 'Password', with: @employee.password
      fill_in 'Password confirmation', with: @employee.password
    end
    click_button 'Sign up'
    expect(page).to have_content 'You have signed up successfully'
    click_on 'Sign out'
  end

  it 'signs in' do
    @employee = FactoryBot.create(:employee)
    visit '/employees/sign_in'
    within('form') do
      fill_in 'Email', with: @employee.email
      fill_in 'Password', with: @employee.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
