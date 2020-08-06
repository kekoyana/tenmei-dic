# frozen_string_literal: true

class Article < ApplicationRecord
  validates :name,         presence: true
  validates :kana,         presence: true, kana: true
  validates :article_type, presence: true
  validates :text,         presence: true
end