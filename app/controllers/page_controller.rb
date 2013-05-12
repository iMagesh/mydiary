class PageController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:status => "publish", :post_type => "post").order("date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by_permalink(params[:permalink])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def diary
    @posts = Post.where(:status => "publish", :post_type => "diary").order("date DESC")

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def photos
    @posts = Post.where(:status => "publish", :post_type => "photo").order("date DESC")

    respond_to do |format|
      format.html {render 'diary'}
      format.json { render json: @posts }
    end
  end

  def videos
    @posts = Post.where(:status => "publish", :post_type => "video").order("date DESC")

    respond_to do |format|
      format.html {render 'diary'}
      format.json { render json: @posts }
    end
  end

  def quotes
    @posts = Post.where(:status => "publish", :post_type => "quote").order("date DESC")

    respond_to do |format|
      format.html {render 'diary'}
      format.json { render json: @posts }
    end
  end

  def links
    @posts = Post.where(:status => "publish", :post_type => "link").order("date DESC")

    respond_to do |format|
      format.html {render 'diary'}
      format.json { render json: @posts }
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.

  def page_params
    params.required(:post).permit(:date, :title, :permalink, :content, :status, :post_type)
  end


end
