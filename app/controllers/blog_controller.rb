class BlogController < CmsController

  def index
    @blogposts = @obj.recent_posts
  end

end
