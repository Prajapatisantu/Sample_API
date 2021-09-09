class Api::V1::ArticlesController < ApplicationController
  before_action :check_user_token
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    user = User.where(auth_token: headers['Authorization'])
    p user
    if user.present?
      respond_to do |format|
        if @article.save
          # format.html { redirect_to @article, notice: "Article was successfully created." }
          # format.json { render :show, status: :created, location: @article }
          format.json{ render json: @article}
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def check_user_token
      if User.where(auth_token: params[:auth_token]).exists? 
        p 9999999999999
        headers['Authorization'] ||= params[:auth_token]
      else
        if current_user.auth_token.present?
          headers['Authorization'] ||= current_user.auth_token
        end
      end
    end
end
