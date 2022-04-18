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

    visit '/kudos/new'
    within('form') do
      fill_in 'Title', with: @kudo.title # rubocop:disable RSpec/InstanceVariable
      fill_in 'Content', with: @kudo.content # rubocop:disable RSpec/InstanceVariable
      select @kudo.receiver.email, from: 'Receiver' # rubocop:disable RSpec/InstanceVariable
    end
    click_button 'Create Kudo'
  end

  it 'Edits in a right way' do
    expect(page).to have_content 'Edit'
    click_on 'Edit'
    within('form') do
      fill_in 'Title', with: @kudo.title # rubocop:disable RSpec/InstanceVariable
      fill_in 'Content', with: @kudo.content # rubocop:disable RSpec/InstanceVariable
      select @kudo.receiver.email, from: 'Receiver' # rubocop:disable RSpec/InstanceVariable
    end
    click_button 'Update Kudo'
    expect(page).to have_content 'Kudo was successfully updated'
  end

  it 'Leaves Title and Content empty' do
    click_on 'Edit'
    within('form') do
      fill_in 'Title', with: ''
      fill_in 'Content', with: ''
    end
    click_button 'Update Kudo'
    expect(page).to have_content "Title can't be blank Content can't be blank"
  end

  it 'Destroys Kudo' do
    click_on 'Destroy'
    expect(page).to have_content 'Kudo was successfully destroyed'
  end
end
