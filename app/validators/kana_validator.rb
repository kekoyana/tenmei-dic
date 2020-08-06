# frozen_string_literal: true

class KanaValidator < ActiveModel::EachValidator
  KANA_REGEX = /\A[0-9ぁ-んー－]+\z/.freeze

  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'invalid kana format') if value.match(KANA_REGEX).blank?
  end
end
