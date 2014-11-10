class Widget < Scrivito::BasicWidget

  def summary
    if self.respond_to?("content")
      sum = self.content.each do |c|
        c.summary
      end
    end
  end

end
