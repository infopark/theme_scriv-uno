class ImageWidget < Widget
  attribute :image, :reference
  attribute :lightbox_gallery_name, :string
  attribute :lightbox_reference, :reference
  attribute :show_in_lightbox, :enum, values: ["Yes", "No"], default: 'No'
  attribute :show_shadow, :enum, values: ["Yes", "No"], default: 'No'

  def lightbox_ref
    self.lightbox_reference.presence || self.image
  end

  def show_shadow?
    show_shadow == "Yes"
  end

end
