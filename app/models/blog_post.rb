class BlogPost < ::Obj

  def blog
    self.parent
  end

  def show_in_navigation?
    false
  end

  def self.valid_page_classes_beneath(path)
    %w(BlogPostComment)
  end

end
