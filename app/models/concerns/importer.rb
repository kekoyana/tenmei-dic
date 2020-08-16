# frozen_string_literal: true

module Importer
  class ImportError < StandardError; end

  private

  def valid_upsert_all(instances)
    instances = instance_with_timestamp(instances)
    if instances.any?(&:invalid?)
      error_message = instances.map { |ins| "#{ins.id}:#{ins.errors.full_messages}" }
      Rails.logger.error(error_message)
      raise(ImportError, error_message)
    end

    upsert_all(instances.map(&:attributes)) # rubocop:disable Rails/SkipsModelValidations
  end

  def instance_with_timestamp(instances)
    time = Time.current
    instances.map do |instance|
      instance.created_at = time
      instance.updated_at = time
      instance
    end
  end
end
