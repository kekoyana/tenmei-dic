# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article::KanaIndex, type: :model do
  let(:klass) { Class.new { extend Article::KanaIndex } }

  describe '#index_by_kana' do
    subject(:index_by_kana) { klass.index_by_kana(kana) }

    context 'かなが あ行' do
      let(:kana) { 'おうあんせき' }

      it { is_expected.to eq 'あ' }
    end

    context 'かなが イレギュラー' do
      let(:kana) { '+255' }

      it { is_expected.to eq '他' }
    end
  end
end
