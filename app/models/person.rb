class Person < ::Obj

  def is_company?
    self.is_company == "yes"
  end

  def summary
    self.title + " "
  end

end
