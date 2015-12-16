class Widget < Scrivito::BasicWidget

  def summary
    if self.respond_to?("content")
      sum = self.content.each do |c|
        c.summary
      end
    end
  end

  def valid_widget_classes_for(field_name)
    if ['body'].include? field_name
      Obj.section_widgets
    else
      Scrivito.models.widgets.map {|e| e} - Obj.section_widgets
    end
  end

end
