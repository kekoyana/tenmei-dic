class Article::Fetcher
  def keko
    "kekomin"
  end

  private

  def config
    Rails.configuration.x.master_seed
  end

  def seed_url
    config.seed_sheets.article
  end
end
