class BlogPost < ::Obj

  def self.valid_page_classes_beneath(path)
    %w(BlogPostComment)
  end

  def blog
    self.parent
  end

  def show_in_navigation?
    false
  end

  def thumbnail_icon
    "foundicon-monitor"
  end

end
