# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string  :name,         null: false
      t.string  :kana,         null: false
      t.integer :article_type, null: false, limit: 1
      t.text    :text,         null: false

      t.timestamps
    end
  end
end
