# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:data) do
    {
      'id'       => 1,
      'name'     => '名称',
      'kana'     => 'めいしょう',
      'category' => '強者',
      'text'     => 'ほんぶん',
    }
  end

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

  describe '.by_data' do
    subject(:instance) { described_class.by_data(data) }

    it 'Articleのインスタンスであり、各値が正しいこと' do
      is_expected.to be_a_kind_of Article
      expect(instance.id).to eq 1
      expect(instance.name).to eq '名称'
      expect(instance.kana).to eq 'めいしょう'
      expect(instance.category).to eq 'hero'
      expect(instance.text).to eq 'ほんぶん'
    end
  end

  describe '.import' do
    subject(:importer) { described_class.import(hashes) }

    before { freeze_time }

    context '正常値のとき' do
      let(:hashes) { [data] }

      it do
        expect { importer }.to change(Article, :count).by(1)
        expect(Article.last.name).to eq '名称'
      end
    end

    context '異常値が含まれているとき' do
      let(:hashes) { [data.merge('name' => nil)] }

      it do
        expect { importer }.to raise_error Importer::ImportError
        expect(Article.count).to eq 0
      end
    end
  end
end
