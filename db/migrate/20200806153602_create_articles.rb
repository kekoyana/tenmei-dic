class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :kana
      t.tinyint :article_type
      t.text :text

      t.timestamps
    end
  end
end
