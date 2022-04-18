require 'rails_helper'

RSpec.describe 'Create Kudo', type: :feature do
  before do
    @giver = create(:employee)
    @kudo = build(:kudo)
    visit '/employees/sign_in'
    within('form') do
      fill_in 'Email', with: @giver.email # rubocop:disable RSpec/InstanceVariable
      fill_in 'Password', with: @giver.password # rubocop:disable RSpec/InstanceVariable
    end
    click_button 'Log in'
  end

  it 'Creates Kudo' do
    visit '/kudos/new'
    within('form') do
      fill_in 'Title', with: @kudo.title # rubocop:disable RSpec/InstanceVariable
      fill_in 'Content', with: @kudo.content # rubocop:disable RSpec/InstanceVariable
      select @kudo.receiver.email, from: 'Receiver' # rubocop:disable RSpec/InstanceVariable
    end
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created'
  end
end
