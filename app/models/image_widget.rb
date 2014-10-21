class ImageWidget < Widget
  def align
    self[:align].presence || 'left'
  end
end
