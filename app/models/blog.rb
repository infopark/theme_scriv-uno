class Blog < ::Obj

  def recent_posts
    self.toclist.select{|post| post.is_a?(BlogPost) && post.date && post.date >= 4.weeks.ago}.sort_by{|post| post.date}.reverse
  end

  def self.valid_page_classes_beneath(path)
    %w(BlogPost)
  end

end
