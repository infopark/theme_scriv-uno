class IconListitemWidget < Widget

  def summary
    ActionController::Base.helpers.strip_tags(self.content).first(200)
  end

end
