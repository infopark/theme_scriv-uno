class BlogPostController < CmsController

  def index
    redirect_to (scrivito_path(@obj.blog) + "##{@obj.id}") and return
  end

end
