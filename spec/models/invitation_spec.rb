RSpec.describe Invitation, type: :model do
  context 'ActiveRecord association' do
    it 'belons to attendee' do
      invitation = Invitation.reflect_on_association(:attendee)
      expect(invitation.macro).to eq(:belongs_to)
    end

    it 'belons to attendee' do
      invitation = Invitation.reflect_on_association(:attended_event)
      expect(invitation.macro).to eq(:belongs_to)
    end
  end
end
