# frozen_string_literal: true

class Article::Fetcher
  def fetch_articles
    parsed_fetch['data'].filter_map do |data|
      next if data['delete_flg'].present?

      Article.by_data(data)
    end
  end

  private

  def parsed_fetch
    Oj.load(fetch)
  end

  def fetch
    HTTPClient.new.get_content(seed_url)
  end

  def seed_url
    config.seed_sheets[:article]
  end

  def config
    Rails.configuration.x.master_seed
  end
end
