class PageController < ApplicationController

  http_basic_authenticate_with :name => APP_CONFIG[:username], :password => APP_CONFIG[:password], :only => [:diary]

  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).where(:status => "publish").order("date DESC").paginate(:page => params[:page], :per_page => 20)
    else
      @posts = Post.where(:status => "publish", :post_type => "post").order("date DESC").paginate(:page => params[:page], :per_page => 10)
    end
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
    redirect_to root_path and return if current_user.nil? || current_user.email != "pingmagesh@gmail.com"
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

  def save_comment
    if !params[:comment].nil? && !params[:comment][:author].blank? && !params[:comment][:author_email].blank? && !params[:comment][:author_url].blank? && !params[:comment][:content].blank?
      c = Comment.new(comment_params)
      c.save
      redirect_to :back, :comment => "true"
    else
      redirect_to :back, :comment => "false"
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.

  def page_params
    params.required(:post).permit(:date, :title, :permalink, :content, :status, :post_type, :tag_list)
  end

  def comment_params
    params.required(:comment).permit(:author, :author_email, :author_url, :content, :post_id)
  end


end
