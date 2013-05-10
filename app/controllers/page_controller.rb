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

end