require 'rails_helper'

RSpec.feature 'Contacts management', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new contact' do
    visit new_contact_path
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone', with: '+55119826589962'
    fill_in 'Notes', with: 'Test note'
    click_button 'Create Contact'

    expect(page).to have_text('Contact was successfully created.')
  end

  scenario 'User edits a contact' do
    contact = FactoryBot.create(:contact, user: user)
    visit edit_contact_path(contact)
    fill_in 'First name', with: 'Jane'
    click_button 'Update Contact'

    expect(page).to have_text('Contact was successfully updated.')
  end
end
