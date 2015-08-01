require 'spec_helper'

describe UsersController, type: :controller do
  let(:user) {create :admin}
  describe 'POST :create' do
    before do
      post :create, user: {email: user.email, role: user.role}
    end
    it 'should respond with redirect' do
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

  describe 'GET :update_password' do
    let(:user) {create :admin}

    context 'the user token is correct' do
      it 'should render view on token confirmation' do
        get :update_password, {user_id: user.id, token: user.confirmation_hash}
        expect(response).to render_template('update_password')
      end
    end

    context 'the user token is missing or incorrect' do
      it 'should redirect to root path ' do
        get :update_password, {user_id: user.id}
        expect(response.status).to eq(302)
      end
    end
  end
end
