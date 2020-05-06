class SearchController < ApplicationController
    def search
        redirect_to articles_path and return unless params[:term].present?
        @articles = Article.search params[:term]
    end
end