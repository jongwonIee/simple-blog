module Readers
  class PostsController < ReadersController
    before_action :set_post
    def show
      # impressionist(@post)
      @views = @post.impressionist_count
      @uniq_views = @post.impressionist_count(:filter=>:ip_address)
    end

    def set_post
      @post = Post.published.friendly.find(params[:id])
    end
  end
end