class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :my_posts]

  def index
    @posts = Post.all
  end

  def my_posts
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(user_params)
    if @post.save
      redirect_to posts_path, notice: "Your blog was created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.expect(post: [:title, :description, :image_url])
    end
end
