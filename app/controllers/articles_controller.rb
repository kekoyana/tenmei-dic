# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_menu, only: %i[index show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def set_menu
    @set_menu =
      Article.order(:kana).pluck(:id, :name, :kana).group_by do |_id, _name, kana|
        Article.index_by_kana(kana)
      end.sort_by(&:first)
  end
end
