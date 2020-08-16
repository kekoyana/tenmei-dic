# frozen_string_literal: true

namespace :master do
  desc 'fetch seed master'
  task fetch: :environment do
    Article::Fetcher.direct_import
  end
end
