class AddLightboxToImageWidgetMigration < Scrivito::Migration
  def up
    Scrivito::ObjClass.find('ImageWidget').attributes.add(name: 'show_in_lightbox', type: :enum, values: %w(yes no))
    Scrivito::ObjClass.find('ImageWidget').attributes.add(name: 'lightbox_gallery_name', type: :string)
    Scrivito::ObjClass.find('ImageWidget').attributes.add(name: 'lightbox_reference', type: :reference)
    Scrivito::ObjClass.find('Image').attributes.add(name: 'title', type: :string)

    Obj.find_by_path("/about_us/gallery").body.first.update(column_2: [
      HeadlineWidget.new(headline: "Image Gallery"),
      ThreeColumnWidget.new(column_1: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_01"), show_in_lightbox: "yes"),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_04"), show_in_lightbox: "yes")
      ], column_2: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_04"), show_in_lightbox: "yes"),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_02"), show_in_lightbox: "yes")
      ], column_3: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_03"), show_in_lightbox: "yes"),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_01"), show_in_lightbox: "yes")
      ])
    ])
  end
end
