require 'spec_helper'

describe UsersController, type: :controller do
  let(:user) {create :admin}
  describe 'POST :create' do
    before do
      post :create, user: {email: user.email, role: user.role}
    end
    it 'should respond with success' do
      expect(response.status).to eq(302)
    end

    it 'should increase the user count by 1' do
      expect{
        post :create, user: {email: user.email, role: user.role}
      }.to change(User, :count).by 1
    end

    it 'should save a confirmation hash' do
      expect(User.last.confirmation_hash).not_to be(nil)
    end

    it 'should send an email' do
      expect{
        post :create, user: {email: user.email, role: user.role}
      }.to change(ActionMailer::Base.deliveries, :count).by 1
    end
  end
end
