class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :logged_in_user, only: %i[new upddate destroy]
  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = current_user.authored_articles.build
  end

  def create
    @article = current_user.authored_articles.build(article_params)
    @article.categorizes.build(category_id: params[:article][:category_ids])
    if @article.save
      flash[:notice] = 'Article Created!'
      redirect_to @article
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article edit success!'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article delete success!'
      redirect_to articles_path
    else
      flash[:alert] = 'Something went wrong!'
      redirect_to @article
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
