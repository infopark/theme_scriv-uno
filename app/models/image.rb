class Image < Obj
  attribute :blob, :binary
  attribute :title, :string

  #
  # Image (binary)
  #

  def image?
    true
  end

end
