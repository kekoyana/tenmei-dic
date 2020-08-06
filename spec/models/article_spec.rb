# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#valid?' do
    subject(:article) { build(:article) }

    it do
      is_expected.to be_valid
    end
  end
end
