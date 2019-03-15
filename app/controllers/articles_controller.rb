class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all # 記事一覧用
  end

  def show
  end

  def new
    @article = Article.new
  end

  # before_actionがあるのでリダイレクト不要
  def edit
  end

  def create
    @article = Article.new(article_params) # ストロングパラメータを引数に
    @article.save # データベースに保存
    redirect_to @article # showページにリダイレクト(転送)
  end

  def update
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_params # ストロングパラメータを定義
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
