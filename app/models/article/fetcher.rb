# frozen_string_literal: true

class Article::Fetcher
  def self.fetch_articles
    parsed_fetch['data'].filter_map do |data|
      next if data.blank?
      next if data['delete_flg'].present?
      next if data['text'].blank?

      Article.by_data(data)
    end
  end

  def self.direct_import
    datum = parsed_fetch['data'].reject do |data|
      data.blank? || data['delete_flg'].present? || data['text'].blank?
    end
    Article.import(datum)
  end

  def self.parsed_fetch
    Oj.load(fetch)
  end

  def self.fetch
    HTTPClient.new.get_content(seed_url)
  end

  def self.seed_url
    config.seed_sheets[:article]
  end

  def self.config
    Rails.configuration.x.master_seed
  end
end
