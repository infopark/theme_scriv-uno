class PersonWidget < Widget
  attribute :colour, :enum, values: ["grey", "white"]
  attribute :person, :reference
  attribute :show_picture, :enum, values: ["Yes", "No"]


  def colour
    self[:colour].presence || "white"
  end

  def summary
    if self.person.present?
      self.person.title + " "
    end
  end

end
