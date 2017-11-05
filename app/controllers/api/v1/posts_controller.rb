module Api
    module V1
      class PostsController < ApplicationController
        before action :set_post, only:[:show, update, destroy]

        def index
          @post = Post.all
          render json: @post.to_json, :layout => false
        end

        def create
          @post = Post.create(post_params)
          render json: @post.to_json, layout => false
        end

        def show
          render json: @post.to_json, layout => false
        end

        def update
          @post = Post.update(post_params)
          render json: @post_to_json, layout => false
        end

        def destroy
          @post.destroy
        end

        private

          def post_params
            params.require(:post).permit(:date, :context, :food, :workout, :weight)
          end

          def set_post
            @post = Post.all.find_by(id: params[:id])

          end



    end
end
