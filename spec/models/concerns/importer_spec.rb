# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importer, type: :model do
  let(:klass) do
    Class.new do
      extend Importer
      def self.upsert_all(hash); end
    end
  end
  let(:hashes) { [{ id: 1 }] }
  let(:time) { Time.current }

  before do
    freeze_time
    allow(klass).to receive(:upsert_all)
  end

  describe '#upsert_all_with_timestamp' do
    it 'hashにタイムスタンプがついてupsert_allが呼ばれること' do
      klass.upsert_all_with_timestamp(hashes)
      expect(klass).to have_received(:upsert_all)
        .with(
          [
            {
              id: 1,
              created_at: time,
              updated_at: time,
            },
          ]
        )
    end
  end
end
