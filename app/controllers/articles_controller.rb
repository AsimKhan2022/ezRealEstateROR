class ArticlesController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /articles or /articles.json
  def index
    # @articles = Article.all
    @articles = @admin.articles
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = @admin.articles.find(params[:id])
  end

  # GET /articles/new
  def new
    # @article = Article.new
    @article = @admin.articles.build
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    @article = @admin.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'

    else
      render :edit
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:id, :title, :story, :images, :headlines, :sub_title, :admin_id)
  end
end
