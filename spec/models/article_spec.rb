# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '.enum_hash_i18n' do
    subject { described_class.enum_hash_i18n(:category) }

    it do
      is_expected.to include(hero: '強者')
    end
  end

  describe '#valid?' do
    subject(:article) { build(:article) }

    it do
      is_expected.to be_valid
    end
  end

  describe '.category_str2sym' do
    subject { described_class.category_str2sym(str) }

    let(:str) { '強者' }

    it ':heroが取得できる' do
      is_expected.to eq :hero
    end
  end

  describe '.by_data' do
    subject(:instance) { described_class.by_data(data) }

    let(:data) do
      {
        'id'       => 1,
        'name'     => '名称',
        'kana'     => 'めいしょう',
        'category' => '強者',
        'text'     => 'ほんぶん',
      }
    end

    it 'Articleのインスタンスであり、各値が正しいこと' do
      is_expected.to be_a_kind_of Article
      expect(instance.id).to eq 1
      expect(instance.name).to eq '名称'
      expect(instance.kana).to eq 'めいしょう'
      expect(instance.category).to eq 'hero'
      expect(instance.text).to eq 'ほんぶん'
    end
  end
end
