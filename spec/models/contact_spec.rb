require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password')
    contact = Contact.new(
      first_name: 'John',
      last_name: 'Doe',
      phone: '+55119826589962',
      notes: 'Test note',
      user: user
    )
    expect(contact).to be_valid
  end

  it 'is not valid without a first name' do
    contact = Contact.new(first_name: nil)
    expect(contact).to_not be_valid
  end

  it 'is not valid without a last name' do
    contact = Contact.new(last_name: nil)
    expect(contact).to_not be_valid
  end

  it 'is not valid without a phone number' do
    contact = Contact.new(phone: nil)
    expect(contact).to_not be_valid
  end
end
