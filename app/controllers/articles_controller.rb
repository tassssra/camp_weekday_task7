class ArticlesController < ApplicationController

  def index
    @articles = Article.all # 記事一覧用
    @new_articles = Article.all # 最新記事用
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params) # ストロングパラメータを引数に
    @article.save # データベースに保存
    redirect_to @article # showページにリダイレクト(転送)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def article_params # ストロングパラメータを定義
    params.require(:article).permit(:title, :body)
  end

end
