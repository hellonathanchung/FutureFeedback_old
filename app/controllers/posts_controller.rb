class PostsController < ApplicationController

    class PostsController < ApplicationController
        before_action :find_, except: [:index, :new, :create]
    
        def index
            @posts = Post.all
        end
    
        def show
        end
    
        def new
            @post = Post.new
        end
    
        def edit
        end
    
        def create
            @post = Post.new(params[:])
            if @post.save
              flash[:success] = "Post successfully created"
              redirect_to @post
            else
              flash[:error] = @post.errors.full_messages
              render 'new'
            end
        end
    
        def update
            if @post.update_attributes(params[:])
              flash[:success] = "Post was successfully updated"
              redirect_to @post
            else
              flash[:error] = @post.errors.full_messages
              render 'edit'
            end
        end
    
        def destroy
            if @post.destroy
                flash[:success] = "Post was successfully deleted"
                redirect_to @posts_path
            else
                flash[:error] = "Something went wrong"
                redirect_to @posts_path
            end
        end
    
        private
    
            def find_
                @post = Post.find(params[:id])
            end
    
    end
    
end
