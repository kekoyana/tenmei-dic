# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KanaValidator, type: :validator do
  subject(:instance) do
    klass.new.tap do |k|
      k.kana = kana
    end
  end

  let(:klass) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :kana

      validates :kana, kana: true

      def self.model_name
        ActiveModel::Name.new(self, nil, 'temp')
      end
    end
  end

  context 'かなのみのとき' do
    let(:kana) { 'あいうえお' }

    it { is_expected.to be_valid }
  end

  context '数字+かなのとき' do
    let(:kana) { 'あいうえお1' }

    it { is_expected.to be_valid }
  end

  context '空文字のとき' do
    let(:kana) { '' }

    it { is_expected.to be_valid }
  end

  context 'nilのとき' do
    let(:kana) { nil }

    it { is_expected.to be_valid }
  end

  context 'かな+カナのとき' do
    let(:kana) { 'あいうえおア' }

    it 'エラーとなること' do
      is_expected.to be_invalid
      expect(instance.errors.messages[:kana]).to include('はかなと半角数字以外の文字が使われています')
    end
  end
end
