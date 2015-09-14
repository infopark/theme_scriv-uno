class Person < ::Obj
  attribute :country, :string
  attribute :email, :string
  attribute :facebook, :link
  attribute :fax, :string
  attribute :flickr, :link
  attribute :function, :string
  attribute :googlemap, :link
  attribute :googleplus, :link
  attribute :image, :reference
  attribute :is_company, :enum, values: ["Yes", "No"]
  attribute :linkedin, :link
  attribute :mobile, :string
  attribute :pinterest, :link
  attribute :postal, :string
  attribute :rss, :link
  attribute :slideshare, :link
  attribute :street, :string
  attribute :telephone, :string
  attribute :title, :string
  attribute :twitter, :link
  attribute :youtube, :link


  def is_company?
    self.is_company == "Yes"
  end

  def thumbnail_icon
    "foundicon-people"
  end

  def summary
    self.title + " "
  end

end
