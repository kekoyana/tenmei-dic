# frozen_string_literal: true

module Importer
  def upsert_all_with_timestamp(hashes)
    hash_with_timestamp(hashes)
      .then { |h| upsert_all(h) }
  end

  private

  def hash_with_timestamp(hashes)
    time = Time.current
    hashes.map do |hash|
      hash[:created_at] = hash[:updated_at] = time
      hash
    end
  end
end
