class ImageWidget < Widget
  attribute :image, :reference
  attribute :lightbox_gallery_name, :string
  attribute :lightbox_reference, :reference
  attribute :show_in_lightbox, :enum, values: ["yes", "no"]

  #
  # ImageWidget (not binary)
  #
  #   image  :reference
  #

  def lightbox_ref
    self.lightbox_reference.presence || self.image
  end

end
