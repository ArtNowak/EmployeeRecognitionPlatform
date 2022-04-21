require 'rails_helper'

RSpec.describe 'Admin kudo panel', type: :feature do
  before do
    @created_admin = create(:admin_user)
    @kudo = create(:kudo)
    visit '/admin_users/sign_in'
    within('form') do
      fill_in 'Email', with: @created_admin.email # rubocop:disable RSpec/InstanceVariable
      fill_in 'Password', with: @created_admin.password # rubocop:disable RSpec/InstanceVariable
    end
    click_button 'Log in'
    visit '/admin/pages/dashboard'
  end

  it 'lists Kudos' do
    expect(page).to have_content 'Destroy'
  end

  it 'destroys Kudo' do
    click_on 'Destroy'
    expect(page).to have_content 'Kudo was successfully destroyed'
  end
end
