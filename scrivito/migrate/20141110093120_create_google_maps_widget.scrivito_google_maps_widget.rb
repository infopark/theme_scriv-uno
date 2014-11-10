class CreateGoogleMapsWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'GoogleMapsWidget',
      type: 'publication',
      title: 'Google Maps',
      attributes: [
        {
          name: 'address',
          type: :string,
        },
      ]
    )
  end
end
