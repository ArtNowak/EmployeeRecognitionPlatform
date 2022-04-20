require 'rails_helper'

RSpec.describe 'Admin sign up', type: :feature do
  let(:created_admin) { create(:admin_user) }

  it 'signs in' do
    visit '/admin_users/sign_in'
    within('form') do
      fill_in 'Email', with: created_admin.email
      fill_in 'Password', with: created_admin.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
