class ArticlesController < ApplicationController

  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end

  private

  def article_params # ストロングパラメータを定義
    params.require(:post).permit(:title, :body)
  end

end
