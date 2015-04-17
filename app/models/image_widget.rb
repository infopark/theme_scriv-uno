class ImageWidget < Widget
  #
  # ImageWidget (not binary)
  #
  #   image  :reference
  #

  def lightbox_ref
    self.lightbox_reference.presence || self.image
  end

end
