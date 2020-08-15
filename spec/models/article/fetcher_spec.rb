# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Article::Fetcher, type: :model do
  describe '#fetch_articles' do
    subject(:fetched) { described_class.new.fetch_articles }

    let(:article_url) { Rails.configuration.x.master_seed.seed_sheets[:article] }
    let(:body) do
      {
        data: [
          {
            id: 1,
            delete_flg: '',
            name: '徽宗',
            kana: 'きそう',
            category: '強者',
            text: '北宋の第8代皇帝',
          },
          {
            id: 2,
            delete_flg: 'true',
            name: '林霊素',
            kana: 'りんれいそ',
            category: '強者',
            text: '北宋の徽宗皇帝時代の道士',
          },
        ],
      }.to_json
    end

    before do
      WebMock.enable!
      WebMock.stub_request(:any, article_url).to_return(
        body: body,
        status: 200
      )
    end

    it 'データが取得でき、delete_flgが有効なデータは取得しない' do
      expect(fetched.size).to eq 1
      expect(fetched[0].name).to eq '徽宗'
      expect(fetched[1]).to be_nil
    end
  end
end
