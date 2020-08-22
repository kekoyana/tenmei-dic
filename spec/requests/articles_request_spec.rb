# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get articles_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:article) { create(:article) }

    it 'returns http success' do
      get article_path(article.id)
      expect(response).to have_http_status(:success)
    end
  end
end
