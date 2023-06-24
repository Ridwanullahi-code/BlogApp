require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'Test PostsController' do
    context 'GET index' do
      before(:example) do
        get '/users/1/posts'
      end

      it 'successful response status for index action' do
        expect(response).to be_successful
      end

      it "render all user's post" do
        expect(response).to render_template(:index)
      end
    end

    context 'GET index' do
      before(:example) do
        get '/users/1/posts/1'
      end

      it 'successful response status for index action' do
        expect(response).to have_http_status(:success)
      end

      it "render specified user's post" do
        expect(response).to render_template(:show)
      end
    end
  end
end
