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

  context 'かな+カナのとき' do
    let(:kana) { 'あいうえおア' }

    it { is_expected.to be_invalid }
  end
end
