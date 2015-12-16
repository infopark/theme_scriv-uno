class InitializeAppMigration < Scrivito::Migration
  def up
    SearchPage.create(
      _path: '/search',
      _permalink: 'search',
      title: 'ScrivUno - Search page'
    )

    Page.create(
      _path: '/about_us',
      _permalink: 'about_us',
      title: 'About us',
      show_in_navigation: 'No'
    )

    Page.create(
      _path: '/layout',
      _permalink: 'layout',
      title: 'Changing Styles',
    )

    Page.create(
      _path: '/this_app',
      _permalink: 'this_app',
      title: 'About This App',
    )

    Page.create(
      _path: '/optimization',
      _permalink: 'optimization',
      title: 'Optimization',
    )

    LoginPage.create(
      _path: '/login',
      _permalink: 'login',
      title: 'Login',
    )

    (1..4).each do |index|
      Image.create(
        _permalink: "teaser_image_0#{index}",
        blob: File.new("app/assets/images/scriv-uno/teaser_0#{index}.jpg")
      )
    end

    (1..4).each do |index|
      Image.create(
        _permalink: "square_image_0#{index}",
        blob: File.new("app/assets/images/scriv-uno/square_0#{index}.jpg")
      )
    end
  end
end
