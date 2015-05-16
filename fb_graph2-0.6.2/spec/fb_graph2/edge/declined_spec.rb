require 'spec_helper'

describe FbGraph2::Edge::Declined do
  context 'included in Event' do
    let(:event) { FbGraph2::Event.new('event_id').authenticate('token') }

    describe '#declined' do
      it 'should return an Array of FbGraph2::User' do
        users = mock_graph :get, 'event_id/declined', 'event/declined', access_token: 'token' do
          event.declined
        end
        users.should be_instance_of FbGraph2::Edge
        users.should_not be_blank
        users.each do |user|
          user.should be_instance_of FbGraph2::User
        end
      end
    end
  end
end