require 'rails_helper'

RSpec.describe(CategoriesController) do
  describe 'POST /categories' do
    let(:params) { { category: { title: title, description: description } } }
    let(:title) { 'Valid Title' }
    let(:description) { 'Valid Description' }
    

    before do
      post :create, params: params
    end

    context 'when the values are valid' do
      it 'returns a successful response' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the title is empty' do
      let(:title) { '' }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the title is longer than 20 characters' do
      let(:title) { 'A' * 21 }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the description empty' do
      let(:description) { '' }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the description is shorter than 10 characters' do
      let(:description) { 'A' * 9 }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the description is longer than 100 characters' do
      let(:description) { 'A' * 101 }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /categories/:id' do
    let!(:category) { Category.create(title: 'Valid title', description: 'Valid description') }
    let(:params) { { id: category.id, category: { title: title, description: description } } }
    let(:title) { 'Valid Title' }
    let(:description) { 'Valid Description' }

    before do
      put :update, params: params
    end

    context 'when the values are valid' do
      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the title is empty' do
      let(:title) { '' }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the title is longer than 20 characters' do
      let(:title) { 'A' * 21 }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the description empty' do
      let(:description) { '' }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the description is shorter than 10 characters' do
      let(:description) { 'A' * 9 }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the description is longer than 100 characters' do
      let(:description) { 'A' * 101 }

      it 'returns a failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    describe 'POST /categories/:id' do
  end
end
