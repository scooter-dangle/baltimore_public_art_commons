require 'spec_helper'

describe UsersController, type: :controller do
  let(:admin) {create :user}
  describe 'POST :create' do
    it 'should respond with success' do
      post :create, email: user.email, role: user.role
      expect(response.status).to eq(200)
    end
  end
end