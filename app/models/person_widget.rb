class PersonWidget < Widget
  
  def summary
    if self.person.present?
      self.person.title + " "
    end
  end

end
