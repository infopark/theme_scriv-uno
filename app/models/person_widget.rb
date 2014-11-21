class PersonWidget < Widget

  def colour
    self[:colour].presence || "white"
  end
  
  def summary
    if self.person.present?
      self.person.title + " "
    end
  end

end
