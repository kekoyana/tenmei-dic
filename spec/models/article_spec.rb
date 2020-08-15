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
    subject(:instance) { described_class.by_data(data) }

    let(:data) do
      {
        'name'     => '名称',
        'kana'     => 'めいしょう',
        'category' => '強者',
        'text'     => 'ほんぶん',
      }
    end

    it do
      is_expected.to be_a_kind_of Article
      expect(instance.name).to eq '名称'
    end
  end
end
