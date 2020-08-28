require 'rails_helper'
# rubocop:disable Layout/LineLength
RSpec.describe Event, type: :model do
  event = Event.new(title: 'Testing', description: 'Testing', location: 'testing', creator_id: 1, date: '2020/08/19')
  user = User.new(id: 1, username: 'Kevin', email: 'kevin@gmail.com', created_at: '2020-08-18 08:41:55', updated_at: '2020-08-18 08:41:55')
  event.creator = user

  context 'validations' do
    it 'should return true (Event fulfill all the requirements)' do
      expect(event).to be_valid
    end

    it 'should return true (event without a date)' do
      event.date = nil
      expect(event).to_not be_valid
    end

    it 'should return true (event without a title)' do
      event.title = nil
      expect(event).to_not be_valid
    end

    it 'should return true (event without a description)' do
      event.description = nil
      expect(event).to_not be_valid
    end

    it 'should return true (event with a small description)' do
      event.description = '1'
      expect(event).to_not be_valid
    end

    it 'should return true (event without a creator)' do
      event.creator_id = nil
      expect(event).to_not be_valid
    end
  end
  describe 'associations' do
    it 'should have a creator assossiated' do
      expect(event).to respond_to(:creator)
    end

    it 'should have many invitations' do
      expect(event).to respond_to(:invitations)
    end

    it 'should have many attendes' do
      expect(event).to respond_to(:attendees)
    end
  end
end
# rubocop:enable Layout/LineLength
