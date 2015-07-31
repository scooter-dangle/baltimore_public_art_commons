require 'spec_helper'

describe UsersController, type: :controller do
  let!(:user) {create :admin}
  describe 'POST :create' do
    it 'should respond with success' do
      post :create, user: {email: user.email, role: user.role}
      expect(response.status).to eq(302)
    end

    it 'should increase the user count by 1' do
      expect{
        post :create, user: {email: user.email, role: user.role}
      }.to change(User, :count).by 1
    end
  end
end
