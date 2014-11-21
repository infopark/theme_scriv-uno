class Person < ::Obj

  def is_company?
    self.is_company == "yes"
  end

  def thumbnail_icon
    "foundicon-people"
  end

  def summary
    self.title + " "
  end

end
