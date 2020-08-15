# frozen_string_literal: true

class Article < ApplicationRecord
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

  def self.by_data(data)
    new(data_slice(data))
  end

  def self.import(datum)
    upsert_all(datum.map(&method(:data_slice)))
  end

  private

  def self.category_str2sym(str)
    enum_hash_i18n(:category).key(str)
  end

  def self.data_slice(data)
    data.sclie('id', 'name', 'kana', 'text')
        .merge(category: category_str2sym(data['category']))
  end

  def category_str2symbol(str); end
end
