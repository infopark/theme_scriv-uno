class Obj < ::Scrivito::BasicObj

  def breadcrumbs
    objects = self.ancestors.split(self.homepage.parent).second.presence || []
    objects + [self]
    #objects.select { |object| object.show_in_navigation? }
  end

  def homepage
    if self.is_a?(Homepage)
      self
    else
      self.ancestors.select{|o| o.is_a?(Homepage)}.first
    end
  end

end
