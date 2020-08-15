# frozen_string_literal: true

class Article < ApplicationRecord
  validates :name,     presence: true
  validates :kana,     presence: true, kana: true
  validates :category, presence: true
  validates :text,     presence: true

  def self.by_data(data)
    import_attr = %w[id name kana category text]
    new(data.slice(*import_attr))
  end
end
