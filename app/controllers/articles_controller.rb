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
    if @article.save
      flash[:success] = 'Article Created!'
      redirect_to @article
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article edit success!'
      redirect_to @article
    else
      flash[:danger] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = 'Article delete success!'
      redirect_to articles_path
    else
      flash[:danger] = 'Something went wrong!'
      redirect_to @article
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
