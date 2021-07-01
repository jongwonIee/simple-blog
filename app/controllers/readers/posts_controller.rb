module Readers
  class PostsController < ReadersController
    before_action :set_post
    def show
      if @post
        impressionist(@post)
      end
      @views = @post.impressionist_count
      @uniq_views = @post.impressionist_count(:filter=>:ip_address)
    end

    def set_post
      @post = Post.published.friendly.find(params[:id])
    end
  end
end