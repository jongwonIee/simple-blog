module Readers
  class PostsController < ReadersController
    impressionist :actions=>[:show]
    def show
      @post = Post.published.friendly.find(params[:id])
      @views = @post.impressionist_count
      @uniq_views = @post.impressionist_count(:filter=>:ip_address)
      impressionist(@post)
    end
  end
end