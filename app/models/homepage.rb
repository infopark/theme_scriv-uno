class Homepage < Obj

  def self.default
    find_by_path('/en')
  end

  def homepage
    self
  end

end
