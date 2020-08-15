# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.enum_hash_i18n(attribute)
    [
      i18n_scope, :attributes, model_name.i18n_key,
      attribute.to_s.pluralize
    ].join('.').then { |scope| I18n.t(scope) }
  end
end
