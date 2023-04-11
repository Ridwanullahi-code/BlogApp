require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'UserController' do
    context 'Get index' do
      before(:example) do
        get '/users'
      end

      it 'render the index template' do
        expect(response).to render_template(:index)
      end
      it 'display list of users' do
        expect(response.body).to include('List all Users')
      end
      it 'should return success status code for index action' do
        expect(response).to have_http_status(200)
      end
    end
    context 'GET show' do
      before(:example) do
        get '/users/1'
      end

      it 'sucessfully response status action' do
        expect(response).to have_http_status(:success)
      end
      it 'render the show template' do
        expect(response).to render_template(:show)
      end
      it 'show specified user' do
        expect(response.body).to include('Show specific user')
      end
    end
  end
end
