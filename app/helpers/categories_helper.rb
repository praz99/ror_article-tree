module CategoriesHelper
  def background_check(var)
    url_for(var.articles.last.image) if var.articles.exists?
  end

  def home_title_check(var)
    if var.articles.exists?
      render 'categories/partials/has_title', cat: var
    else
      content_tag(:p, 'no articles', class: ['index-category-articles-count'])
    end
  end

  def article_count_check(var)
    if var.articles.exists?
      render 'categories/partials/has_article', category: var
    else
      content_tag(:p, 'no articles', class: ['index-category-articles-count'])
    end
  end

  def featured_article_check
    if @featured_article.blank?
      render 'categories/partials/featured_article_missing'
    else
      render 'categories/partials/featured_article_exists'
    end
  end
end
