class Homepage < Obj

  def self.default
    find_by_path('/en')
  end

  def homepage
    self
  end

  def valid_widget_classes_for(field)
    %w[ElasticSliderWidget]
  end

end
