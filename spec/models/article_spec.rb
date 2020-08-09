# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#valid?' do
    subject(:article) { build(:article) }

    it do
      is_expected.to be_valid
    end
  end

  describe '.by_data' do
    subject { described_class.by_data(data) }

    let(:data) do
      {
        "name"         => "名称",
        "kana"         => "めいしょう",
        "article_type" => "強者",
        "text"         => "ほんぶん",
      }
    end

    it do
      is_expected.to be_a_kind_of Article
      expect(subject.name).to eq "名称"
    end
  end
end
