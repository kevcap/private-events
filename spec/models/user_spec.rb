require 'rails_helper'

RSpec.describe User, type: :model do
	context 'validate users attributes' do
		user = User.new

		it 'should invalidate the absence of username' do
			user.email = 'user@example.com'
			expect(user).to_not be_valid 
		end

		
		it 'validates the presence of both username and email' do
			user.username = "Example User"
			expect(user).to  be_valid
		end

		it 'should reject user with improperly formatted email' do
			user.email = 'userexample.com'
			expect(user).to_not be_valid
		end

		it 'should change all upper case letters to down case in the email' do
			user.email = 'usEr@ExaMple.COM'
			user.save
			expect(user.email).to match('user@example.com') 
		end
	end
	
end