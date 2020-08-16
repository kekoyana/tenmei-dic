# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Article::Fetcher, type: :model do
  describe '.fetch_articles' do
    include_context 'stub http master_seed'
    subject(:fetched) { described_class.fetch_articles }

    it 'データが取得でき、delete_flgが有効なデータは取得しない' do
      expect(fetched.size).to eq 1
      expect(fetched[0].name).to eq '徽宗'
      expect(fetched[1]).to be_nil
    end
  end

  describe '.direct_import' do
    include_context 'stub http master_seed'
    subject(:fetched) { described_class.direct_import }

    it 'データがimportされること' do
      expect { fetched }.to change(Article, :count).by(1)
      Article.last.tap do |article|
        expect(article.id).to eq 1
        expect(article.name).to eq '徽宗'
      end
    end
  end
end
