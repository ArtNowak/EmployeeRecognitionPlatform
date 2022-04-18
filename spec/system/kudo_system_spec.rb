require 'rails_helper'

RSpec.describe 'Create Kudo', type: :feature do
  before do
    @giver = FactoryBot.create(:employee)
    visit '/employees/sign_in'
    within('form') do
      fill_in 'Email', with: @giver.email
      fill_in 'Password', with: @giver.password
    end
    click_button 'Log in'
  end

  it 'Creates Kudo' do
    @kudo = FactoryBot.build(:kudo)
    visit '/kudos/new'
    within('form') do
      fill_in 'Title', with: @kudo.title
      fill_in 'Content', with: @kudo.content
      select @kudo.receiver.email, from: 'Receiver'
    end
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created'
  end
end

RSpec.describe 'Edit/Destroy Kudo', type: :feature do
  before do
    @giver = FactoryBot.create(:employee)
    visit '/employees/sign_in'
    within('form') do
      fill_in 'Email', with: @giver.email
      fill_in 'Password', with: @giver.password
    end
    click_button 'Log in'

    @kudo = FactoryBot.build(:kudo)
    visit '/kudos/new'
    within('form') do
      fill_in 'Title', with: @kudo.title
      fill_in 'Content', with: @kudo.content
      select @kudo.receiver.email, from: 'Receiver'
    end
    click_button 'Create Kudo'
  end

  it 'Edits in a right way' do
    @kudo = FactoryBot.build(:kudo)
    click_on 'Edit'
    within('form') do
      fill_in 'Title', with: @kudo.title
      fill_in 'Content', with: @kudo.content
      select @kudo.receiver.email, from: 'Receiver'
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
