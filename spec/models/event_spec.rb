require 'rails_helper'
RSpec.describe Event, type: :model do
<<<<<<< HEAD
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
=======
  event = Event.new(title: "Testing", description: "Testing", location: 'testing', creator_id: 1, date: '2020/08/19')
  user = User.new(id: 1, username: "Kevin", email: "kevin@gmail.com", created_at: "2020-08-18 08:41:55", updated_at: "2020-08-18 08:41:55")
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
>>>>>>> fc594516022d6720489bafd2fc5f328ce6369706
