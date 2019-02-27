require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: 'John', last_name: 'Lennon', email: 'john@lEnnon.ca', password: 'abc123', password_confirmation: 'abc123')}

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a password' do
      subject.password_digest = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if email is in use' do
      newuser = User.new(first_name: 'John', last_name: 'notLennon', email: subject.email, password: 'abc123', password_confirmation: 'abc123')
      newuser.save
      newuser2 = User.new(first_name: 'John', last_name: 'kindaLennon', email: newuser.email, password: 'abc123', password_confirmation: 'abc123')
      newuser2.save
      expect(newuser2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    newuser = User.new(first_name: 'Johnny', last_name: 'Lennon', email: ' johnny@lEnnon.ca', password: 'abc123', password_confirmation: 'abc123')
    newuser.save
    it 'is valid with valid attributes' do
      login = User.authenticate_with_credentials(' johnny@Lennon.ca  ', 'abc123')
      expect(login).to_not be_nil
    end
  end
end
