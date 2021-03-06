# frozen_string_literal: true

class Article < ApplicationRecord
  extend Importer
  extend KanaIndex
  validates :name,     presence: true
  validates :kana,     presence: true, kana: true
  validates :category, presence: true
  validates :text,     presence: true

  enum category: {
    hero:       1, # 強者
    prefecture: 2, # 府州
    position:   3, # 身分
    event:      4, # イベント
    command:    5, # コマンド
    topography: 6, # 地形
    parameter:  7, # ステータス
    word:       8, # 用語
    other:      99, # その他
  }

  class << self
    def by_data(data)
      new(data_slice(data))
    end

    def import(hashes)
      articles = hashes.map(&method(:by_data))
      valid_upsert_all(articles)
    end

    private

    def category_str2sym(str)
      enum_hash_i18n(:category).key(str)
    end

    def data_slice(data)
      data.slice('id', 'name', 'kana', 'text')
          .merge(category: category_str2sym(data['category']))
    end
  end

  def kana_index
    self.class.index_by_kana(kana)
  end

  def category_name
    self.class.enum_hash_i18n(:categories)[category]
  end
end
