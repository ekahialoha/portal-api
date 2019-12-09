require 'rails_helper'

RSpec.describe 'Authentication', type: :request do

  before(:each) do
    @user = FactoryBot.create(:user)
    @post_params = { user: {
        email: @user.email,
        password: @user.password
      }
    }
  end

  describe 'POST /users/sign_in' do

    context 'when params is valid' do
      before do
        post '/users/sign_in', params: @post_params
        @body = JSON.parse(response.body)
      end

      it "response status code 200" do
        expect(response.status).to eq 200
      end

      it "response contains success:true" do
        expect(@body['success']).to eq true
      end

      it "response header contains authorization token" do
        expect(response.headers['Authorization']).to be_present
      end

      it "response header authorization token is valid" do
        token = response.headers['Authorization'].split(' ').last
        token = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true)
        expect(token.first['jti']).to be_present
      end
    end

    context 'when params is missing or invalid' do
      before do

      end

      it "response status code is 401" do

      end

      it "response contains error: true" do

      end

      it "response contains errors" do

      end
    end
  end

  describe 'DELETE /users/sign_out' do
    it "response status code 200" do

    end

    it "response contains success: true" do

    end

    it "response header contains no authorization token" do

    end
  end
end
