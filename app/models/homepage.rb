class Homepage < Obj

  def self.default
    find_by_path('/')
  end

  def homepage
    self
  end

end
