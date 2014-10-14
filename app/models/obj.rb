class Obj < ::Scrivito::BasicObj

  def homepage
    if self.is_a?(Homepage)
      self
    else
      self.ancestors.select{|o| o.is_a?(Homepage)}.first
    end
  end

end
