require 'rails_helper'
RSpec.describe Event, type: :model do
  context 'validate event attributes' do
    user = User.create(username: 'Example User', email: 'user@email.com')
    
    event = user.events.create(title: 'Lunch and Learn', location: 'online', date: '30/08/2020', description: 'Moving from being a to a software engineer')
    
    it 'validates an event with all the attributes filled out' do
      expect(event).to be_valid 
    end

    it 'invalidates an event with no title' do
      event.title = ''
			expect(event).to_not be_valid 
		end

    it 'invalidates an event with empty location attribute' do
      event.title = 'Lunch and Learn'
      event.location = ''
      expect(event).to_not be_valid  
    end
  end

  context 'ActiveRecord associations' do
		it 'belongs to creator' do
			event = Event.reflect_on_association(:creator)
			expect(event.macro).to eq(:belongs_to) 
		end

		it 'has many ' do
			event = Event.reflect_on_association(:invitations)
			expect(event.macro).to eq(:has_many) 
    end
    
    it 'has many ' do
			event = Event.reflect_on_association(:attendees)
			expect(event.macro).to eq(:has_many) 
		end
  end
end
